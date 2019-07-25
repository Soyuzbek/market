"""market URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django import get_version
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.contrib.sitemaps.views import sitemap
from django.urls import path, include
from django.views.decorators.cache import cache_page
from django.views.decorators.csrf import csrf_exempt
from django.views.i18n import JavaScriptCatalog
from rest_framework import viewsets, routers
from rest_framework.permissions import AllowAny

from market.sitemaps import StaticViewSitemap, ProductSitemap, CategorySitemap
from products import views as pro_views
from products.models import Review, Product
from products.serializer import ReviewSerializer, ProductSerializer, EmailSerializer
from products.views import CartView
from users.models import Email
from users.views import LanguageView


# ViewSets define the view behavior.
class ReviewViewSet(viewsets.ModelViewSet):
    queryset = Review.objects.all()
    serializer_class = ReviewSerializer


class ProductViewSet(viewsets.ModelViewSet):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer
    permission_classes = (AllowAny,)


class EmailViewSet(viewsets.ModelViewSet):
    queryset = Email.objects.all()
    serializer_class = EmailSerializer
    permission_classes = (AllowAny,)


# Routers provide an easy way of automatically determining the URL conf.
router = routers.DefaultRouter()
router.register('reviews', ReviewViewSet)
router.register('products', ProductViewSet)
router.register('emails', EmailViewSet)
# Wire up our API using automatic URL routing.
# Additionally, we include login URLs for the browsable API.

sitemaps = {
    'static': StaticViewSitemap,
    'product': ProductSitemap,
    'category': CategorySitemap
}
# js_info_dict = {
#     'domain': 'djangojs',
#     'packages': ('admin',),
# }

urlpatterns = [
    path('sitemap.xml', sitemap, {'sitemaps': sitemaps}),
    path('api/', include(router.urls)),
    path('admin/', admin.site.urls),
    path('lang/<str:lang>', LanguageView.as_view(), name='lang'),
    path('translate/', include('rosetta.urls')),
    path('', pro_views.IndexView.as_view(), name='home'),
    path('shop/', pro_views.ShopView.as_view(), name='only_shop'),
    path('shop/<str:slug>/', pro_views.ShopView.as_view(), name='shop'),
    path('product/<str:slug>/', pro_views.ProductDetailView.as_view(), name='product'),
    path('cart/', csrf_exempt(CartView.as_view()), name='cart'),
    path('favourite/', pro_views.FavView.as_view(), name='fav'),
    path('search/', pro_views.SearchView.as_view(), name='search'),
    path('checkout/', pro_views.OrderView.as_view(), name='checkout'),
    path('orders/', pro_views.OrderList.as_view(), name='orders'),
    path('order/<int:pk>/', pro_views.OrderDetail.as_view(), name='order'),
    path('api-auth/', include('rest_framework.urls')),
    path('jsi18n/', JavaScriptCatalog.as_view(), name='javascript-catalog'),
    # path('jsi18n/',
    #      cache_page(86400, key_prefix='js18n-%s' % get_version())(JavaScriptCatalog.as_view()),
    #      name='javascript-catalog'),
]

urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
if settings.DEBUG:
    import debug_toolbar

    urlpatterns += [
        path('__debug__/', include(debug_toolbar.urls)),

    ]
