from django.db import models
from firstapp.models import Members
from django.contrib.auth.models import User

# Create your models here.

class Account(models.Model):
    user = models.OneToOneField(User, null=True, on_delete = models.CASCADE)
    applications = models.ManyToManyField(Members)
