from django.contrib import admin

from products.models import Product, Category, Brand, Image, Size, Color, Favourite, Order, OrderProduct


@admin.register(Product)
class ProdcutAdmin(admin.ModelAdmin):
    list_display = ('name', 'price', 'discount', 'get_colors', 'status')
    list_editable = ('price', 'discount', 'status')

    @staticmethod
    def get_colors(obj):
        return "\n\t".join([c.name for c in obj.color.all()])


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    pass


@admin.register(Brand)
class BrandAdmin(admin.ModelAdmin):
    pass


@admin.register(Image)
class ImageAdmin(admin.ModelAdmin):
    pass


@admin.register(Size)
class SizeAdmin(admin.ModelAdmin):
    pass


@admin.register(Color)
class ColorAdmin(admin.ModelAdmin):
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
    list_editable = ('address', )
    inlines = [ProdOrderInline]
    pass
