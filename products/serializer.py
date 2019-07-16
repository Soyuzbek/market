from rest_framework import serializers

from products.models import Review, Product
from users.models import Email


class ReviewSerializer(serializers.ModelSerializer):
    class Meta:
        model = Review
        fields = ('name', 'email', 'rating', 'comment', 'product')


class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = Product
        fields = '__all__'


# serializers for users app models

class EmailSerializer(serializers.ModelSerializer):
    class Meta:
        model = Email
        fields = ('email', )
