from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.contrib.auth.models import AbstractUser
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.utils.translation import gettext_lazy as _
from django.db import models
from django.utils import timezone


class Town(models.Model):
    name = models.CharField(max_length=40, null=True)
    country = models.CharField(max_length=254, null=True)

    class Meta:
        verbose_name_plural = _('Towns')
        verbose_name = _('Town')

    def __str__(self):
        return f'{self.name}'


class UserManager(BaseUserManager):

    def _create_user(self, email, password, is_staff, is_superuser, **extra_fields):
        if not email:
            raise ValueError('Users must have an email address')
        now = timezone.now()
        email = self.normalize_email(email)
        user = self.model(
            email=email,
            is_staff=is_staff,
            is_active=True,
            is_superuser=is_superuser,
            last_login=now,
            date_joined=now,
            **extra_fields
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, email, password, **extra_fields):
        return self._create_user(email, password, False, False, **extra_fields)

    def create_superuser(self, email, password, **extra_fields):
        user = self._create_user(email, password, True, True, **extra_fields)
        user.save(using=self._db)
        return user


class User(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(max_length=254, unique=True)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    last_login = models.DateTimeField(null=True, blank=True)
    date_joined = models.DateTimeField(auto_now_add=True)

    USERNAME_FIELD = 'email'
    EMAIL_FIELD = 'email'
    REQUIRED_FIELDS = []

    objects = UserManager()

    def __str__(self):
        return f'{self.email}'

    # def get_absolute_url(self):
    #     return "/users/%i/" % (self.pk)


class UserProfile(models.Model):
    user = models.OneToOneField(User, models.CASCADE, related_name='profile', null=True)
    first_name = models.CharField(max_length=254, null=True)
    last_name = models.CharField(max_length=254, null=True)
    company_name = models.CharField(max_length=254, null=True, blank=True)
    address = models.CharField(max_length=254, null=True)
    town = models.ForeignKey('Town', models.DO_NOTHING, 'user_set', null=True)

    def __str__(self):
        return f'of {self.user}'


class Email(models.Model):
    email = models.EmailField(unique=True, max_length=254)

    def __str__(self):
        return f'{self.email}'


@receiver(post_save, sender=User)
def create_or_update_user_profile(sender, instance, created, **kwargs):
    if created:
        UserProfile.objects.create(user=instance)
    instance.profile.save()
