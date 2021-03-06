# Generated by Django 2.2.2 on 2019-07-10 07:32

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0012_auto_20190710_0545'),
    ]

    operations = [
        migrations.AddField(
            model_name='orderproduct',
            name='prodid',
            field=models.CharField(max_length=254, null=True, verbose_name='id of product'),
        ),
        migrations.AlterField(
            model_name='order',
            name='address',
            field=models.CharField(help_text="We can't take order without address", max_length=254, null=True, verbose_name='address'),
        ),
        migrations.AlterField(
            model_name='order',
            name='email',
            field=models.EmailField(help_text='Please enter a valide email', max_length=254, verbose_name='email'),
        ),
        migrations.AlterField(
            model_name='order',
            name='first_name',
            field=models.CharField(help_text='Please enter your name', max_length=254, null=True, verbose_name='first name'),
        ),
        migrations.AlterField(
            model_name='order',
            name='last_name',
            field=models.CharField(help_text="Last name can't be blank", max_length=254, null=True, verbose_name='last name'),
        ),
        migrations.AlterField(
            model_name='order',
            name='phone',
            field=models.CharField(help_text='Enter your phone number', max_length=15, null=True, validators=[django.core.validators.RegexValidator(message='+996(123)456789', regex='^\\+?996?\\d{9,15}$')], verbose_name='phone'),
        ),
    ]
