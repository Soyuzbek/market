# Generated by Django 2.2.2 on 2019-07-08 16:09

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0009_order_orderproduct'),
    ]

    operations = [
        migrations.AlterField(
            model_name='orderproduct',
            name='order',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='product_set', to='products.Order'),
        ),
    ]
