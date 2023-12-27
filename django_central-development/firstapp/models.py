from django.db import models

# Create your models here.

class Members(models.Model):
    APP_CHOICES = (
    ('', 'Select APP'),
    ('erp','ERP'),
    ('odoo','Odoo'),
    ('elasticsearch', 'Elastic Search')
    )

    SERVER_STATUS = (
        ('', 'Select Status'),
        ('live','Live'),
        ('testing', 'Testing'),
        ('alpha', 'Alpha'),
        ('beta', 'Beta'),
        ('dberror','DB Error')
    )

    APP_BELONGS = (
        ('', 'Select Belongs'),
        ('MCS','MCS'),
        ('MCS SL','MCS SL'),
        ('VV MARINE','VV MARINE'),
        ('VV PAIINT','VV PAIINT'),
        ('DS SUGARS','DS SUGARS'),
        ('AMT','AMT'),
        # ('mcs','MCS'),
        ('ajax', 'Ajax'),
        ('vvgroups', 'VVGroups'),
    )

    SERVER_SELECTION = (
        ('', 'Select Server'),
        ('live','Live'),
        ('local', 'Local'),        
    )

    # fields for model
    name = models.CharField(max_length=130, null=True, blank=True,)
    domain = models.CharField(max_length=30, blank=True)
    authentication_url = models.CharField(max_length = 1000, null=True, blank=True,)
    server = models.CharField(max_length = 100, null=True, blank=True,)
    description = models.TextField(null=True, blank=True,)
    logo_img = models.ImageField(upload_to='img/', null=True, blank=True)
    based_on = models.CharField(max_length=20, choices=APP_CHOICES, default='', null=True, blank=True)
    server_status_on = models.CharField(max_length=20, choices=SERVER_STATUS, default='', null=True, blank=True)
    app_belongs = models.CharField(max_length=20, choices=APP_BELONGS, default='', null=True, blank=True)
    server_selection = models.CharField(max_length=20, choices=SERVER_SELECTION, default='', null=True, blank=True)
    is_active = models.BooleanField(default=True)

    def __str__(self):
        return f'{self.name} - {self.app_belongs}'

