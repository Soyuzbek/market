# Generated by Django 2.2.2 on 2019-07-23 10:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0022_auto_20190720_1339'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='email',
            field=models.EmailField(help_text='Please enter a valid email', max_length=254, verbose_name='email'),
        ),
    ]