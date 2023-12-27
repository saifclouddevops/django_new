from django.urls import path
from . import views as ul

urlpatterns = [
    path('login/', ul.login_request, name='login'),
    path("logout/", ul.logout_request, name= "logout"),
    path("useraccess/", ul.user_access, name='user_access'),
    path("userprofile/", ul.user_profile, name='userprofile'),
    path("add_userprofile/", ul.add_user_profile, name='add_userprofile'),
    # path("contact/", ul.contact, name='contact'),
]
