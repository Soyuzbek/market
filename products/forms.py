from django.forms import ModelForm, TextInput, forms, Textarea
from django.utils.translation import gettext_lazy as _

from products.models import Order, Review


class OrderForm(ModelForm):
    class Meta:
        model = Order
        exclude = ['subtotal', 'delivery', 'total']
        widgets = {
            'first_name': TextInput(attrs={'class': 'form-control', 'placeholder': _('First Name'), }),
            'last_name': TextInput(attrs={'class': 'form-control', 'placeholder': _('Last Name')}),
            'email': TextInput(attrs={'class': 'form-control', 'placeholder': _('E-mail')}),
            'address': TextInput(attrs={'class': 'form-control', 'placeholder': _('address')}),
            'zip_code': TextInput(attrs={'class': 'form-control', 'placeholder': _('ZIP code')}),
            'phone': TextInput(attrs={'class': 'form-control', 'placeholder': '+996(___)__-__-__'}),
            'comment': Textarea(
                attrs={'class': 'form-control w-100', 'placeholder': _('Leave a comment about your order'), 'cols': 30, 'rows': 30})
        }


class ReviewForm(ModelForm):
    class Meta:
        model = Review
        exclude = ('', )
        widgets = {
            'name': TextInput(attrs={'class': 'form-control', 'placeholder': _('Your name please')}),
            'email': TextInput(attrs={'class': 'form-control', 'placeholder': _('example@mail.kg')}),
            'rating': TextInput(attrs={'class': 'd-none', 'required': True}),
            'comment': Textarea(attrs={'class': 'form-control', 'placeholder': _('Leave your comment'), 'cols': 30, 'rows': 5}),
        }
