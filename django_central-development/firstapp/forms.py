from django import forms
from .models import Members

class MemberForm(forms.ModelForm):
  
    # create meta class
    class Meta:
        # specify model to be used
        model = Members
  
        # specify fields to be used
        fields = [
            "name",
            "domain",
            "authentication_url",
            "description",
            "server",
            "logo_img",
            "based_on",
            "server_status_on",
            "app_belongs",
            "server_selection"
        ]
