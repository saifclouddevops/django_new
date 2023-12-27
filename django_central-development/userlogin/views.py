from django.shortcuts import  render, redirect
from .forms import NewUserForm
from django.contrib.auth import login, authenticate, logout #add this
from django.contrib import messages
from django.contrib.auth.forms import AuthenticationForm #add this
from datetime import datetime
import datetime
from django.contrib.auth import get_user_model
from .models import myProfile
from .forms import UserProfileForm
from django.contrib.auth.decorators import login_required

# def register_request(request):
# 	...

def login_request(request):
	if request.method == "POST":
		form = AuthenticationForm(request, data=request.POST)
        
		if form.is_valid():
			username = form.cleaned_data.get('username')
			password = form.cleaned_data.get('password')
			user = authenticate(username=username, password=password)
			if user is not None:
				login(request, user)
				messages.info(request, f"You are now logged in as {username}.")
				return redirect("/")
			else:
				messages.error(request,"Invalid username or password.")
		else:
			messages.error(request,"Invalid username or password.")

	form = AuthenticationForm()
	return render(request, "login.html", {"login_form":form})

def logout_request(request):
	logout(request)
	return redirect("/accounts/login")


@login_required(login_url='/accounts/login/')
def user_access(request):
	all_users = get_user_model().objects.all().values()
	context= {'allusers': all_users}
	return render(request, 'user_access.html', context)


@login_required(login_url='/accounts/login/')
def user_profile(request):
	get_profile_cnt = myProfile.objects.filter(user_id = request.user.id).exists()
	print("get_profile_cnt", get_profile_cnt)
	if not get_profile_cnt:
		return redirect("/add_userprofile/")
	else:
		form = UserProfileForm()
		get_profile = myProfile.objects.get(user_id = request.user.id)
		get_profile_rec = myProfile.objects.get(id = get_profile.id)
		if request.method == "POST":
			if 'save_profile' in request.POST:
				form = UserProfileForm(request.POST, request.FILES, instance = get_profile_rec)
				if form.is_valid():
					form.save()
					return redirect('/userprofile/')
				else:
					print(form.errors)
					pass
			else:
				form = UserProfileForm()

	return render(request, 'users_profile.html', {'form':form, 'get_profile': get_profile})


@login_required(login_url='/accounts/login/')
def add_user_profile(request):
	form = UserProfileForm()
	if request.method == "POST":
		form = UserProfileForm(request.POST, request.FILES)
		if form.is_valid():
			form.save()
			return redirect('/userprofile/')
		else:
			print(form.errors)
			pass
	else:
		form = UserProfileForm()

	return render(request, 'add_user_profile.html')


# @login_required(login_url='/accounts/login/')
# def contact(request):
# 	return render(request, 'pages_contact.html')


