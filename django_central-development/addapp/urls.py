from django.urls import path
from . import views

urlpatterns = [
    path('add_user/', views.register_user, name = "add_user"),
    path('list_user/', views.list_user, name = "list_user"),
    path('edit_user/<int:id>', views.edit_user, name = "edit_user"),
    path('update_user/<int:id>', views.update_user, name = "update_user"),
    path('view_user/<int:id>', views.view_user, name = "view_user"),
    path('delete_user/<int:id>', views.delete_user, name = "delete_user"),
]