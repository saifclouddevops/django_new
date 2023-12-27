from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
from .models import myProfile


# Create your forms here.

class NewUserForm(UserCreationForm):
	email = forms.EmailField(required=True)

	class Meta:
		model = User
		fields = ("username", "email", "password1", "password2")

	def save(self, commit=True):
		user = super(NewUserForm, self).save(commit=False)
		user.email = self.cleaned_data['email']
		if commit:
			user.save()
		return user

class UserProfileForm(forms.ModelForm):
	# create meta class
    class Meta:
        # specify model to be used
        model = myProfile
  
        # specify fields to be used
        fields = [
            "first_name",
            "last_name",
            "email",
            "description",
            "company",
            "job",
            "country",
            "address",
            "phone",
            "twitter",
            "facebook",
            "instagram",
            "linkedin",
            "profile_img",
            "user"
        ]




