# Generated by Django 2.2.2 on 2019-06-30 15:16

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Brand',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20, verbose_name='name')),
                ('image', models.ImageField(upload_to='brands/', verbose_name='image')),
                ('about', models.TextField(blank=True, verbose_name='about')),
            ],
            options={
                'verbose_name': 'Brand',
                'verbose_name_plural': 'Brands',
            },
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='name')),
            ],
            options={
                'verbose_name': 'Category',
                'verbose_name_plural': 'Categories',
            },
        ),
        migrations.CreateModel(
            name='Color',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=6, verbose_name='name')),
                ('image', models.ImageField(blank=True, upload_to='colors/', verbose_name='image')),
            ],
            options={
                'verbose_name': 'Color',
                'verbose_name_plural': 'Colors',
            },
        ),
        migrations.CreateModel(
            name='Size',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('value', models.CharField(max_length=8, verbose_name='size')),
                ('code', models.CharField(blank=True, max_length=6, verbose_name='code')),
            ],
            options={
                'verbose_name': 'Size',
                'verbose_name_plural': 'Sizes',
            },
        ),
        migrations.CreateModel(
            name='Product',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='name')),
                ('description', models.TextField(null=True, verbose_name='description')),
                ('price', models.DecimalField(decimal_places=2, max_digits=10, null=True, verbose_name='price')),
                ('discount', models.PositiveSmallIntegerField(default=0, verbose_name='discount')),
                ('rating', models.DecimalField(decimal_places=2, default=0, max_digits=3, verbose_name='rating')),
                ('status', models.CharField(choices=[('0', 'Not available'), ('1', 'In stock')], default=('1', 'In stock'), max_length=30, verbose_name='status')),
                ('brand', models.ForeignKey(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='products.Brand', verbose_name='brand')),
                ('category', models.ForeignKey(null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='products.Category', verbose_name='category')),
                ('color', models.ManyToManyField(related_name='color', to='products.Color')),
                ('size', models.ManyToManyField(to='products.Size', verbose_name='size')),
            ],
            options={
                'verbose_name': 'Product',
                'verbose_name_plural': 'Products',
            },
        ),
        migrations.CreateModel(
            name='Image',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(upload_to='product-images/', verbose_name='image')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='products.Product', verbose_name='product')),
            ],
            options={
                'verbose_name': 'Image',
                'verbose_name_plural': 'Images',
            },
        ),
        migrations.CreateModel(
            name='Favourite',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('products', models.ManyToManyField(to='products.Product', verbose_name='products')),
            ],
            options={
                'verbose_name': 'Favourite',
                'verbose_name_plural': 'Favourites',
            },
        ),
    ]
