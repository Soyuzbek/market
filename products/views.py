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
            this_category = get_object_or_404(Category, slug=slug)
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
    slug_field = 'slug'
    query_pk_and_slug = True

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
        product = get_object_or_404(Product, pk=request.POST.get('id'))
        cart_list = [x for x in cart_list if x['prodid'] != str(product.id)]
        if product.status == _('In stock'):
            cart_list.append({'prodid': str(product.id),
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
        print(request.PUT.get('qty'))
        print(cart_list)
        for el in cart_list:
            if el['prodid'] == request.PUT.get('id'):
                el['quantity'] = request.PUT.get('qty')
                print(el['quantity'])
        request.session['cart'] = cart_list
        request.session['subtotal'] = str(
            sum([Decimal(i['price']) * int(i['quantity']) for i in request.session.get('cart', [])]))
        return JsonResponse({'data': request.session['subtotal']})

    def delete(self, request):
        if request.session['cart']:
            request.session['cart'] = []
            request.session['subtotal'] = '0'
            return JsonResponse({'data': _('Your cart has been cleared cleared successfully'), 'status': True})
        return JsonResponse({'data': _('Your cart is already clear'), 'status': False})


# Favourites
class FavView(View):
    model = Product
    template_name = 'shop.html'

    def get(self, request):
        slugs = request.session.get('favourites', [])
        product_set = self.model.objects.filter(slug__in=slugs)
        return render(request, self.template_name, locals())

    def post(self, request):
        slug = request.POST.get('slug')
        get_object_or_404(self.model, slug=slug)
        slugs = request.session.get('favourites', [])
        if slug not in slugs:
            slugs.append(slug)
            request.session['favourites'] = slugs
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
        print(request.POST)
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
            return render(request, 'alert.html', {'danger': _('Order can\'t be empty')})
        print(form.errors)
        return render(request, self.template_name, {'form': form})


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
