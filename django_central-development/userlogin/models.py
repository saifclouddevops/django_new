from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class myProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=130, null=True, blank=True)
    last_name = models.CharField(max_length=130, null=True, blank=True)
    email = models.CharField(max_length=130, null=True, blank=True)
    description = models.TextField()
    company = models.CharField(max_length=50, null=True, blank=True)
    job = models.CharField(max_length=50, null=True, blank=True)
    country = models.CharField(max_length=50, null=True, blank=True)
    address = models.CharField(max_length=255, null=True, blank=True)
    phone = models.CharField(max_length=50, null=True, blank=True)
    twitter = models.CharField(max_length=100, null=True, blank=True)
    facebook = models.CharField(max_length=100, null=True, blank=True)
    instagram = models.CharField(max_length=100, null=True, blank=True)
    linkedin = models.CharField(max_length=100, null=True, blank=True)
    profile_img = models.ImageField(upload_to='profile/', null=True, blank=True)

    def __str__(self):
        return self.first_name + " " + self.last_name
    

