from decimal import Decimal
from unicodedata import decimal
from urllib.parse import unquote

from django.contrib import messages
from django.contrib.admin.views.decorators import staff_member_required
from django.contrib.postgres.search import SearchVector
from django.db.models import Min
from django.http import HttpResponseRedirect, QueryDict, JsonResponse
from django.shortcuts import render, get_object_or_404
from django.utils.decorators import method_decorator
from django.utils.translation import gettext_lazy as _
from django.views import View
from django.views.generic import DetailView, ListView
from rest_framework.generics import CreateAPIView
from rest_framework.permissions import AllowAny

from products.forms import OrderForm, ReviewForm
from products.models import Category, Product, Brand, Color, Order, OrderProduct, Review
from products.serializer import ReviewSerializer


class IndexView(View):
    model = Category
    template_name = 'index.html'

    def get(self, request):
        home = 'active'
        category_set = [(category, category.product_set.aggregate(Min('price'))) for category in
                        self.model.objects.all()]
        return render(request, self.template_name, locals())


class ShopView(View):
    model = Product
    template_name = 'shop.html'

    def get(self, request, slug=None):
        shop = 'active'
        if slug is None:
            this_category = Category.objects.first()
        else:
            this_category = get_object_or_404(Category, name=unquote(slug))
        category_set = Category.objects.all()
        brands = request.GET.getlist('brands')
        product_set = self.model.objects.filter(category=this_category)
        if brands:
            product_set = product_set.filter(brand__name__in=request.GET.getlist('brands'))
        minv = request.GET.get('min_val')
        if minv:
            maxv = request.GET.get('max_val')
            product_set = product_set.filter(price__range=[minv, maxv])
        brand_set = Brand.objects.filter(category_set=this_category)
        product_set.order_by(request.GET.get('select', 'price'))
        return render(request, self.template_name, locals())


class ProductDetailView(DetailView):
    model = Product
    template_name = 'product-details.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['form'] = ReviewForm
        return context


# Cart
class CartView(View):
    template_name = 'cart.html'

    def get(self, request):
        request.session.get('cart', [])
        cart_list = request.session.get('cart', [])
        subtotal = request.session.get('subtotal', 0.00)
        total = subtotal
        return render(request, self.template_name, locals())

    def post(self, request):
        cart_list = request.session.get('cart', [])
        product = Product.objects.get(pk=request.POST.get('pk'))
        cart_list = [x for x in cart_list if x['prodid'] !=product.id]
        if product.status == _('In stock'):
            cart_list.append({'prodid': product.id,
                              'name': product.name,
                              'price': str(product.price),
                              'quantity': request.POST.get('qty', '1'),
                              'photo': str(product.image_set.first().image.url),
                              # 'size': request.POST.get('size'),
                              # 'color': request.POST.get('color'),
                              })
            request.session['cart'] = cart_list
            request.session['subtotal'] = str(
                sum([Decimal(i['price']) * int(i['quantity']) for i in request.session.get('cart')]))
            return JsonResponse({'data': _('The product successfully added to your cart'), 'status': True})
        return JsonResponse({'data': _('Selected product is not available'), 'status': False})

    def put(self, request):
        request.PUT = QueryDict(request.body)
        cart_list = request.session.get('cart')
        for el in cart_list:
            if el['prodid'] == int(request.PUT.get('pk')):
                el['quantity'] = request.PUT.get('qty')
                print(el['quantity'])
        request.session['cart'] = cart_list
        request.session['subtotal'] = str(
            sum([Decimal(i['price']) * int(i['quantity']) for i in request.session.get('cart')]))
        return JsonResponse({'data': request.session['subtotal']})

    def delete(self, request):
        if request.session['cart']:
            request.session['cart'] = []
            return JsonResponse({'data': _('Your cart has been cleared cleared successfully'), 'status': True})
        return JsonResponse({'data': _('Your cart is already clear'), 'status': False})


# Favourites
class FavView(View):
    model = Product
    template_name = 'shop.html'

    def get(self, request):
        pks = request.session.get('favourites', [])
        product_set = self.model.objects.filter(pk__in=pks)
        return render(request, self.template_name, locals())

    def post(self, request):
        pk = str(request.POST.get('pk'))
        pks = request.session.get('favourites', [])
        if pk not in pks:
            pks.append(pk)
            request.session['favourites'] = pks
        return JsonResponse({'data': _('This product selected as your favourite'), 'status': True})


class SearchView(View):

    def get(self, request):
        product_set = Product.objects.annotate(search=SearchVector('name', 'category__name', 'brand__name')).filter(
            search__contains=request.GET.get('search', ''))
        return render(request, 'shop.html', locals())


# Orders and Checkout
class OrderView(View):
    form_class = OrderForm
    template_name = 'checkout.html'

    def get(self, request):
        checkout = 'active'
        total = request.session.get('subtotal', 0)
        form = self.form_class()
        return render(request, self.template_name, locals())

    def post(self, request):
        form = self.form_class(request.POST)
        total = request.session.get('subtotal', 0)
        checkout = 'active'
        if form.is_valid() and total !='0':
            order = form.save(commit=False)
            order.subtotal = request.session.get('subtotal', 0)
            order.total = order.subtotal
            order.save()
            product_set_json = request.session.get('cart', [])
            if len(product_set_json) != 0:
                for product_json in product_set_json:
                    OrderProduct.objects.create(**product_json, order=order)
                return render(request, 'alert.html', {'success': _('Your order conformed successfully')})
            order.delete()
            return JsonResponse({'data':  _('Order can\'t be empty')})
        return JsonResponse({'data':  _('Please correct following fields')})


class OrderList(ListView):
    model = Order
    template_name = 'orders.html'

    @method_decorator(staff_member_required)
    def dispatch(self, *args, **kwargs):
        return super().dispatch(*args, **kwargs)


class OrderDetail(DetailView):
    model = Order
    template_name = 'order.html'

    @method_decorator(staff_member_required)
    def dispatch(self, *args, **kwargs):
        return super().dispatch(*args, **kwargs)
