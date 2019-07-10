from django.forms import ModelForm, TextInput, forms, Textarea

from products.models import Order


class OrderForm(ModelForm):
    class Meta:
        model = Order
        exclude = ['subtotal', 'delivery', 'total']
        widgets = {
            'first_name': TextInput(attrs={'class': 'form-control', 'placeholder': 'First Name', }),
            'last_name': TextInput(attrs={'class': 'form-control', 'placeholder': 'Last Name'}),
            'email': TextInput(attrs={'class': 'form-control', 'placeholder': 'E-mail'}),
            'address': TextInput(attrs={'class': 'form-control', 'placeholder': 'address'}),
            'zip_code': TextInput(attrs={'class': 'form-control', 'placeholder': 'ZIP code'}),
            'phone': TextInput(attrs={'class': 'form-control', 'placeholder': 'Phone Number'}),
            'comment': Textarea(
                attrs={'class': 'form-control w-100', 'placeholder': 'Leave a comment about your order', 'cols': 30, 'rows': 30})
        }
