from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django.contrib.auth.models import User
from django import forms

class RegisterUserForm(UserCreationForm):
    email = forms.EmailField()
    first_name = forms.CharField(max_length = 500)
    last_name = forms.CharField(max_length = 500)

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email', 'password1', 'password2')

     # method for cleaning the data
    def clean(self):
        super(RegisterUserForm, self).clean()

        # getting username and password from cleaned_data
        username = self.cleaned_data.get('username')
        password1 = self.cleaned_data.get('password1')
        password2 = self.cleaned_data.get('password2')

        # validating the username and password
        if username == None:
            self._errors['username'] = self.error_class(['User name field is required'])

        if password1 == None:
            self._errors['password1'] = self.error_class(['Password field is required'])
        elif len(password1) < 3:
            self._errors['password1'] = self.error_class(['Password length should not be less than 3 characters'])

        if password2 == None:
            self._errors['password1'] = self.error_class(['Confirm Password field is required'])

        if password1 != password2:
            self._errors['password2'] = self.error_class(['Confirm Password not match with Password'])

        return self.cleaned_data



class EditRegisterUserForm(UserChangeForm):
    password = None

    class Meta:
        model = User
        fields = ('username', 'first_name', 'last_name', 'email', 'is_active', 'is_staff', 'is_superuser')