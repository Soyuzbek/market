from django.contrib.sitemaps import Sitemap
from django.urls import reverse

from products.models import Product, Category


class StaticViewSitemap(Sitemap):

    def items(self):
        return ['home', 'only_shop']

    def location(self, obj):
        return reverse(obj)


class ProductSitemap(Sitemap):

    def items(self):
        return Product.objects.all()


class CategorySitemap(Sitemap):

    def items(self):
        return Category.objects.all()