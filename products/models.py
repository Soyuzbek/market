import sys
from io import BytesIO, StringIO
from PIL import Image as IM
from django.core.files.uploadedfile import InMemoryUploadedFile
from django.core.validators import RegexValidator
from django.db import models
from django.utils.translation import gettext_lazy as _


class Category(models.Model):
    name = models.CharField(_('name'), max_length=255)
    image = models.ImageField(_('image'), upload_to='categories/', null=True)

    def __str__(self):
        return self.name

    class Meta:
        verbose_name = _('Category')
        verbose_name_plural = _('Categories')


class Brand(models.Model):
    name = models.CharField(_('name'), max_length=20)
    category_set = models.ManyToManyField(Category, 'brand_set', verbose_name=_('category set'))
    image = models.ImageField(_('image'), upload_to='brands/')
    about = models.TextField(_('about'), blank=True)

    class Meta:
        verbose_name = _('Brand')
        verbose_name_plural = _('Brands')

    def __str__(self):
        return self.name


class Size(models.Model):
    value = models.CharField(_('size'), max_length=8)
    code = models.CharField(_('code'), max_length=6, blank=True)

    class Meta:
        verbose_name = _('Size')
        verbose_name_plural = _('Sizes')

    def __str__(self):
        return self.value


class Color(models.Model):
    name = models.CharField(_('name'), max_length=6)
    image = models.ImageField(_('image'), upload_to='colors/', blank=True)

    class Meta:
        verbose_name = _('Color')
        verbose_name_plural = _('Colors')

    def __str__(self):
        return self.name


class Image(models.Model):
    image = models.ImageField(_('image'), upload_to='product-images/')
    product = models.ForeignKey('Product', on_delete=models.CASCADE, verbose_name=_('product'),
                                related_name='image_set')

    class Meta:
        verbose_name = _('Image')
        verbose_name_plural = _('Images')

    def __str__(self):
        return f'{self.product} - {self.id}'

    def save(self, **kwargs):
        super().save()  # saving image first

        img = IM.open(self.image.path) # Open image using self

        if img.height > 533 or img.width > 533:
            new_img = (533, 533)
            img.thumbnail(new_img)
            img.save(self.image.path)


class Product(models.Model):
    STATUS_CHOICES = [
        (_('Not available'), _('Not available')),
        (_('In stock'), _('In stock'))
    ]
    name = models.CharField(_('name'), max_length=255)
    description = models.TextField(_('description'), null=True)
    category = models.ForeignKey(Category, on_delete=models.DO_NOTHING, verbose_name=_('category'), null=True)
    brand = models.ForeignKey(Brand, on_delete=models.DO_NOTHING, verbose_name=_('brand'), null=True)
    color = models.ManyToManyField(Color, _('color'))
    size = models.ManyToManyField(Size, verbose_name=_('size'))
    price = models.DecimalField(_('price'), max_digits=10, decimal_places=2, null=True)
    discount = models.PositiveSmallIntegerField(_('discount'), default=0)
    rating = models.DecimalField(_('rating'), max_digits=4, decimal_places=2, default=0)
    status = models.CharField(_('status'), max_length=30, choices=STATUS_CHOICES, default=STATUS_CHOICES[1])
    date = models.DateTimeField(_('date'), auto_now=True)

    class Meta:
        verbose_name = _('Product')
        verbose_name_plural = _('Products')

    def __str__(self):
        return str(self.name)


class Favourite(models.Model):
    user = models.ForeignKey('users.User', on_delete=models.CASCADE, verbose_name=_('user'))
    products = models.ManyToManyField(Product, verbose_name=_('products'))

    class Meta:
        verbose_name = _('Favourite')
        verbose_name_plural = _('Favourites')

    def __str__(self):
        return f'{self.user} favorites'


class Order(models.Model):
    first_name = models.CharField(_('first name'), max_length=254, null=True)
    last_name = models.CharField(_('last name'), max_length=254, null=True)
    email = models.EmailField(verbose_name=_('email'))
    address = models.CharField(_('address'), max_length=254, null=True)
    phone_regex_kg = RegexValidator(regex=r'^\+?996?\d{9,15}$',
                                    message=_("Phone number must be entered in the format:"
                                              " '+996999999'. Up to 15 digits allowed"))
    phone = models.CharField(verbose_name=_('phone'), max_length=15, validators=[phone_regex_kg], null=True, blank=True)
    zip_code = models.CharField(_('zip code'), max_length=10)
    subtotal = models.CharField(_('subtotal'), max_length=30)
    total = models.CharField(_('total'), max_length=30)
    delivery = models.CharField(_('delivery'), max_length=30, default='0')
    comment = models.TextField(_('comment'))
    date = models.DateTimeField(_('date'), auto_now_add=True, null=True)

    class Meta:
        verbose_name = _('Order')
        verbose_name_plural = _('Orders')


class OrderProduct(models.Model):
    name = models.CharField(_('name'), max_length=255)
    price = models.DecimalField(_('price'), max_digits=10, decimal_places=2, null=True)
    quantity = models.PositiveSmallIntegerField(_('quantity'), )
    photo = models.ImageField(_('photo'))
    order = models.ForeignKey(Order, models.CASCADE, 'product_set')
