from django.contrib import admin

from products.models import Product, Category, Brand, Image, Favourite, Order, OrderProduct, Review, Color, Size
from users.models import Email


class ImageInline(admin.StackedInline):
    model = Image
    can_delete = True
    fk_name = 'product'


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = ('name', 'price', 'discount', 'get_colors', 'status')
    list_editable = ('price', 'discount', 'status')
    inlines = (ImageInline,)

    @staticmethod
    def get_colors(obj):
        return "\n\t".join([c.name for c in obj.color.all()])


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    pass


@admin.register(Brand)
class BrandAdmin(admin.ModelAdmin):
    pass


@admin.register(Favourite)
class FavouriteAdmin(admin.ModelAdmin):
    pass


class ProdOrderInline(admin.StackedInline):
    model = OrderProduct
    can_delete = True
    verbose_name = 'Product'
    fk_name = 'order'


@admin.register(Order)
class OrderAdmin(admin.ModelAdmin):
    list_display = ('id', 'first_name', 'email', 'date', 'address')
    list_editable = ('address',)
    inlines = [ProdOrderInline]
    pass


@admin.register(Review)
class ReviewAdmin(admin.ModelAdmin):
    pass


@admin.register(Email)
class EmailAdmin(admin.ModelAdmin):
    pass

@admin.register(Color)
class ColorAdmin(admin.ModelAdmin):
    pass


@admin.register(Size)
class SizeAdmin(admin.ModelAdmin):
    pass
