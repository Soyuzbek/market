# Generated by Django 2.2.2 on 2019-07-04 08:06

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0005_auto_20190702_1215'),
    ]

    operations = [
        migrations.AddField(
            model_name='product',
            name='date',
            field=models.DateTimeField(auto_now=True, verbose_name='date'),
        ),
    ]