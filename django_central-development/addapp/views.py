from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from .forms import RegisterUserForm, EditRegisterUserForm
from firstapp.models import Members
from .models import Account
from django.contrib.auth.models import User
from django.contrib.auth.hashers import make_password, check_password
from django.contrib.auth.decorators import login_required


# Create your views here.
@login_required(login_url='/accounts/login/')
def register_user(request):
    all = Members.objects.all().values('id', 'name')
    if request.method == "POST":
        form = RegisterUserForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data["username"]
            first_name = form.cleaned_data["first_name"]
            last_name = form.cleaned_data["last_name"]
            email = form.cleaned_data["email"]
            password1 = form.cleaned_data["password1"]
            password2 = form.cleaned_data["password2"]

            if password1 == password2:
                user_data = {'username': username, 'first_name': first_name, 'last_name': last_name, 'email':email, 'password': make_password(password1)}
                user_data1 = User.objects.create(**user_data)
                apps = Account.objects.create(user=user_data1)
                getMember = request.POST.getlist('account-0-applications')
                for memberid in getMember:
                    choosedApp = Members.objects.get(id=int(memberid))
                    apps.applications.add(choosedApp)
            return redirect('/list_user/')
        else:
            print(form.errors)
    else:
        form = RegisterUserForm()
        
    return render(request, 'users_add.html', {'form': form, 'all': all})

#List User
@login_required(login_url='/accounts/login/')
def list_user(request):
    if request.user.is_superuser:
        users = User.objects.all().values()
    else:
        users = User.objects.filter(id = request.user.id)
    context= {'users': users}
    return render(request, 'user_access.html', context)

#Edit User
@login_required(login_url='/accounts/login/')
def edit_user(request, id):
    getAppname = []
    users = User.objects.get(id = id)
    all = Members.objects.all().values('id', 'name')
    selected = Account.objects.get(user_id=id)
    selectedApp = selected.applications.all()
    for selectedApps in selectedApp:
        getAppname.append(selectedApps.name)
    context = {'users': users, 'members': all, 'getAppname': getAppname}
    return render(request, 'user_edit.html', context)

#update User
@login_required(login_url='/accounts/login/')
def update_user(request, id):  
    all = Members.objects.all().values('id', 'name')
    users = User.objects.get(id = id)
    apps = Account.objects.get(user_id = id)
    apps.applications.clear()
    
    if request.user.is_authenticated:
        if request.method == "POST":
            form = EditRegisterUserForm(request.POST, instance = users)
            if form.is_valid():
                form.save()

                getMember = request.POST.getlist('account-0-applications')
                for memberid in getMember:
                    choosedApp = Members.objects.get(id=int(memberid))
                    apps.applications.add(choosedApp)
                return redirect("/list_user/") 
            else:
                print(form.errors, "Value not submit cause of invalid value")
                pass
        else:
            form = EditRegisterUserForm(instance = users)

        context = {'users': users, 'members': all}
        return render(request, 'user_edit.html', context)  

# View User
@login_required(login_url='/accounts/login/')
def view_user(request, id):
    getAppname = []
    users = User.objects.get(id = id)
    all = Members.objects.all().values('id', 'name')

    # getting many to many values from the Account table
    selected = Account.objects.get(user_id=id)
    selectedApp = selected.applications.all()
    for selectedApps in selectedApp:
        getAppname.append(selectedApps.name)
    context = {'users': users, 'members': all, 'getAppname': getAppname}
    return render(request, 'user_view.html', context)

# Delete User
@login_required(login_url='/accounts/login/')
def delete_user(request, id):  
    users = User.objects.get(id=id)  
    users.delete()  
    return redirect("/list_user/")

