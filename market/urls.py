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
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include
from django.views.decorators.csrf import csrf_exempt

from products.views import CartView
from users import views as user_views
from products import views as pro_views
from users.views import LanguageView

urlpatterns = [
    path('admin/', admin.site.urls),
    path('lang/<str:lang>', LanguageView.as_view(), name='lang'),
    path('translate/', include('rosetta.urls')),
    path('', pro_views.IndexView.as_view(), name='home'),
    path('shop/', pro_views.ShopView.as_view(), name='only_shop'),
    path('shop/<str:slug>/', pro_views.ShopView.as_view(), name='shop'),
    path('product/<int:pk>/', pro_views.ProductDetailView.as_view(), name='product'),
    path('cart/', csrf_exempt(CartView.as_view()), name='cart'),
    path('favourite/', pro_views.FavView.as_view(), name='fav'),
    path('search/', pro_views.SearchView.as_view(), name='search'),
    path('checkout/', pro_views.OrderView.as_view(), name='checkout'),
    path('orders/', pro_views.OrderList.as_view(), name='orders'),
    path('order/<int:pk>/', pro_views.OrderDetail.as_view(), name='order'),
]

urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
if settings.DEBUG:
    import debug_toolbar
    urlpatterns += [
        path('__debug__/', include(debug_toolbar.urls)),

    ]