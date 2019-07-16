# Generated by Django 2.2.2 on 2019-07-14 06:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('products', '0016_review_product'),
    ]

    operations = [
        migrations.AlterField(
            model_name='review',
            name='email',
            field=models.EmailField(help_text="The email field can't be empty", max_length=254, unique=True, verbose_name='Email'),
        ),
    ]
