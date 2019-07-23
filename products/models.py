from PIL import Image as IM
from django.core.validators import RegexValidator, MinLengthValidator
from django.db import models
from django.db.models.signals import post_save, pre_save
from django.dispatch import receiver
from django.urls import reverse
from django.utils.text import slugify
from django.utils.translation import gettext_lazy as _
from unidecode import unidecode


class Category(models.Model):
    name = models.CharField(_('name'), max_length=255)
    image = models.ImageField(_('image'), upload_to='categories/', null=True)

    class Meta:
        verbose_name = _('Category')
        verbose_name_plural = _('Categories')
        ordering = ['name']

    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse('shop', kwargs={'slug': self.name})


class Review(models.Model):
    product = models.ForeignKey('Product', models.CASCADE, 'review_set', verbose_name=_('product'), null=True)
    name = models.CharField(_('name'), max_length=255, help_text=_('Please enter your name'))
    email = models.EmailField(verbose_name=_('Email'), help_text=_('The email field can\'t be empty'), unique=True)
    rating = models.DecimalField(_('Your rating'), max_digits=4, decimal_places=2, help_text=_('Please rate us'))
    comment = models.TextField(verbose_name=_('comment'), validators=[MinLengthValidator(15)], null=True, blank=True)

    class Meta:
        verbose_name_plural = _('Reviews')
        verbose_name = _('Review')


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

        img = IM.open(self.image.path)  # Open image using self

        if img.height > 533 or img.width > 533:
            new_img = (533, 533)
            img.thumbnail(new_img)
            img.save(self.image.path)


class Product(models.Model):
    STATUS_CHOICES = [
        (_('Not available'), _('Not available')),
        (_('In stock'), _('In stock'))
    ]
    name = models.CharField(_('name'), max_length=255, unique=True)
    slug = models.SlugField(blank=True, null=True)
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
        ordering = ['name']

    def __str__(self):
        return str(self.name)

    def save(self, *args, **kwargs):
        self.slug = slugify(unidecode(self.name))
        super().save(*args, **kwargs)

    def get_absolute_url(self):
        return reverse('product', kwargs={'slug': self.slug})


class Favourite(models.Model):
    user = models.ForeignKey('users.User', on_delete=models.CASCADE, verbose_name=_('user'))
    products = models.ManyToManyField(Product, verbose_name=_('products'))

    class Meta:
        verbose_name = _('Favourite')
        verbose_name_plural = _('Favourites')

    def __str__(self):
        return f'{self.user} favorites'


class Order(models.Model):
    first_name = models.CharField(_('first name'), max_length=254, null=True, help_text=_('Please enter your name'))
    last_name = models.CharField(_('last name'), max_length=254, null=True, help_text=_('Last name can\'t be blank'))
    email = models.EmailField(verbose_name=_('email'), help_text=_('Please enter a valid email'))
    address = models.CharField(_('address'), max_length=254, null=True,
                               help_text=_('We can\'t take order without address'))
    phone_regex_kg = RegexValidator(regex=r'^\+?996?\d{9,15}$',
                                    message=_("+996(123)456789"))
    phone_regex_short_kg = RegexValidator(regex=r'^\0?\d{8,12}$', message='0(123)456789')
    phone = models.CharField(verbose_name=_('phone'), max_length=15, validators=[phone_regex_kg],
                             help_text=_('Enter your phone number'), null=True)
    zip_code = models.CharField(_('zip code'), max_length=10, null=True, blank=True)
    subtotal = models.CharField(_('subtotal'), max_length=30)
    total = models.CharField(_('total'), max_length=30)
    delivery = models.CharField(_('delivery'), max_length=30, default='0')
    comment = models.TextField(_('comment'), null=True, blank=True)
    date = models.DateTimeField(_('date'), auto_now_add=True, null=True)

    class Meta:
        verbose_name = _('Order')
        verbose_name_plural = _('Orders')


class OrderProduct(models.Model):
    prodid = models.CharField(_('id of product'), max_length=254, null=True)
    name = models.CharField(_('name'), max_length=255)
    price = models.DecimalField(_('price'), max_digits=10, decimal_places=2, null=True)
    quantity = models.PositiveSmallIntegerField(_('quantity'), )
    photo = models.ImageField(_('photo'))
    order = models.ForeignKey(Order, models.CASCADE, 'product_set')

    class Meta:
        ordering = ['name']


@receiver(pre_save, sender=Review)
def presave_review(sender, instance, created=None, **kwargs):
    if not created:
        if instance.rating > 5:
            instance.rating = 5
        if instance.rating < 0:
            instance.rating = 1


@receiver(post_save, sender=Review)
def postsave_review(sender, instance, created=None, **kwargs):
    if created:
        instance.product.rating = sum(
            [review.rating for review in sender.objects.filter(product=instance.product)]) / len(
            sender.objects.filter(product=instance.product))
        instance.product.save()
