from django.urls import path
from . import views as fa

urlpatterns = [
    path('add/', fa.create_view, name='create_view'),
    # path('list/', fa.display, name='list'),
    path('', fa.display, name='list'),
    path('show/<int:id>',fa.show, name="show"),  
    path('edit/<int:id>', fa.edit, name="edit"),  
    path('update/<int:id>', fa.update, name="update"),  
    path('delete/<int:id>', fa.destroy, name="delete"),  
    path('list_local/', fa.display_local, name='list_local'),
    path('geturl/', fa.geturl, name='geturl'),
    path('app_config/', fa.appconfig, name='appconfig'),
    path('search/', fa.search, name='search'),
]
