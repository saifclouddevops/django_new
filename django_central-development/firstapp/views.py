from django.shortcuts import render
from .models import Members
from .forms import MemberForm
from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
from django.contrib.auth.decorators import login_required
from datetime import datetime
import datetime, json
from addapp.models import Account
from django.contrib.auth.models import User
from allauth.socialaccount.models import SocialAccount
import psycopg2
import datetime
from http import client
import psycopg2
import psycopg2.extras
# import MySQLdb as mariadb
# from keycloak.keycloak_openid import KeycloakOpenID
# from django.http import httpResponse

app_choices = Members.APP_CHOICES
server_status = Members.SERVER_STATUS
app_belongs = Members.APP_BELONGS
server_selections = Members.SERVER_SELECTION

# Create your views here.
def default(obj):
    """Default JSON serializer."""
    import calendar, datetime

    if isinstance(obj, datetime.datetime):
        if obj.utcoffset() is not None:
            obj = obj - obj.utcoffset()
        millis = int(
            calendar.timegm(obj.timetuple()) * 1000 +
            obj.microsecond / 1000
        )
        return millis
    raise TypeError('Not sure how to serialize %s' % (obj,))

@login_required(login_url='/accounts/login/')
def create_view(request):
    context = {}
    if request.method == 'POST':
        form = MemberForm(request.POST, request.FILES)
        print(request.POST, "form input")
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/app_config/')
    else:
        form = MemberForm()

    context['form']= form
    context={'app_choices':app_choices, 'server_status':server_status, 'app_belongs':app_belongs, 'server_selections':server_selections}
    return render(request, "members.html", context)

@login_required(login_url='/accounts/login/')
def display(request):
    all = Members.objects.all().values()

    # get login user's applications only
    print(request.user)
    user = User.objects.get(username=request.user.username)
    
    loginUserId = request.user.id
    print(loginUserId, "loginUserId loginUserId")
    addapp_acc = Account.objects.get(user_id = loginUserId)
    getapp_list = addapp_acc.applications.all()

    yes = Members.objects.count()
    belongs = []
    linknames = []
    app_list = []
    for app_name in getapp_list:
        app_list.append(app_name.app_belongs)
    print(app_list,"dkskoidfid")
    app_list = set(app_list)
    for alll in all:
        if alll['server_selection'] == 'live':        
            if alll['is_active'] and alll['app_belongs'] in app_list:
                server_status = check_status(alll['domain'])
                print(server_status,"server_status")
                members_obj = Members.objects.get(domain=alll['domain'])
                members_obj.server_status_on= server_status
                members_obj.save()
                print(members_obj.server_status_on,"djmlkjskdjlk")
                belongs.append(alll['app_belongs'])                
                link_name = alll['name'].split('_')
                linknames.append({alll['name']:link_name[1]})
                print(linknames,"dsknks")

    belongs = set(belongs)
    linknames = linknames
    print(linknames,"linknames")

    if request.user.is_authenticated:
        current_user = request.user
        request.session['username'] = current_user.username
        last_login = str(request.user.last_login)
        request.session['last_login'] = last_login

        current_datetime = datetime.date.today()
        # convert datetime obj to string
        str_current_datetime = str(current_datetime)

        # create a file object along with extension
        file_name = "userlog/"+"userslog_"+str_current_datetime+".txt"
        f=open(file_name, "a+")
        f.write("loggin user %s and the time of login %s \n\n" %(request.session['username'], request.session['last_login']))
        f.close()
    return render(request, 'list.html', {'Members':getapp_list, "belongs":belongs,"linknames":linknames})

@login_required(login_url='/accounts/login/')
def display_local(request):
    # all = Members.objects.all().values()

    # # get login user's applications only
    # loginUserId = request.user.id
    # addapp_acc = Account.objects.get(user_id = loginUserId)
    # getapp_list = addapp_acc.applications.all()

    # yes = Members.objects.count()
    # belongs = []
    # for alll in all:
    #     belongs.append(alll['app_belongs'])
    # belongs = set(belongs)


    all = Members.objects.all().values()

    # get login user's applications only
    print(request.user)
    user = User.objects.get(username=request.user.username)
    
    loginUserId = request.user.id
    print(loginUserId, "loginUserId loginUserId")
    addapp_acc = Account.objects.get(user_id = loginUserId)
    getapp_list = addapp_acc.applications.all()

    yes = Members.objects.count()
    belongs = []
    linknames = []
    app_list = []
    for app_name in getapp_list:
        app_list.append(app_name.app_belongs)
    print(app_list,"siva")
    app_list = set(app_list)
    for alll in all:
        print(alll['name'],"APP Name")
        if alll['server_selection'] == 'local':        
            if alll['is_active'] and alll['app_belongs'] in app_list:
                print(alll['name'],"APP Name1")
                server_status = 'alpha'
                print(server_status,"server_status")
                members_obj = Members.objects.get(domain=alll['domain'])
                members_obj.server_status_on= server_status
                members_obj.save()
                print(members_obj.server_status_on,"djmlkjskdjlk")
                belongs.append(alll['app_belongs'])
                link_name = alll['name'].split('_')
                linknames.append({alll['name']:link_name[1]})

    belongs = set(belongs)
    linknames = linknames
    print(linknames,"linknames")

    if request.user.is_authenticated:
        current_user = request.user
        request.session['username'] = current_user.username
        last_login = str(request.user.last_login)
        request.session['last_login'] = last_login

        current_datetime = datetime.date.today()
        # convert datetime obj to string
        str_current_datetime = str(current_datetime)

        # create a file object along with extension
        file_name = "userlog/"+"userslog_"+str_current_datetime+".txt"
        f=open(file_name, "a+")
        f.write("loggin user %s and the time of login %s \n\n" %(request.session['username'], request.session['last_login']))
        f.close()
    return render(request, 'list_local.html', {'Members':getapp_list, "belongs":belongs,"linknames":linknames})

def geturl(request):
    siteurl = request.POST.get("siteurl")
    request.session['siteurl'] = siteurl
    current_datetime = datetime.date.today()

    # convert datetime obj to string
    str_current_datetime = str(current_datetime)

    # create a file object along with extension
    file_name = "userlog/"+"userslog_"+str_current_datetime+".txt"
    f=open(file_name, "a+")
    f.write("%s user clicked this site %s \n\n" %(request.session['username'], request.session['siteurl']))
    f.close()
    return HttpResponse(True)

# List Application
@login_required(login_url='/accounts/login/')
def appconfig(request):
    isAdminUser = request.user.is_superuser
    # print(isAdminUser, "isAdminUserisAdminUser")
    if request.user.is_superuser:
        all = Members.objects.all().values()
    else:
        apps = Account.objects.get(user_id = request.user.id)
        all = apps.applications.all().values()
    return render(request, 'app_config.html', {'Members':all})

#View Application
@login_required(login_url='/accounts/login/')
def show(request, id):  
    applications = Members.objects.get(id=id)

    # getting user list for this app
    getapp_pk = []
    get_usr_list = []
    addapp_appl_acc = Account.applications.through.objects.filter(members_id=id)
    for aaa in addapp_appl_acc:
        addapp_acc = Account.objects.get(id = aaa.account_id)
        getapp_pk.append(addapp_acc.user_id)
    getuser_list = User.objects.filter(id__in = getapp_pk)

    for getuser_lists in getuser_list:
        uname = getuser_lists.username
        getprovider_chk = SocialAccount.objects.filter(user_id = getuser_lists.id)
        social_pro = []
        for getprovider_chks in getprovider_chk:
            social_pro.append(getprovider_chks.provider)
        get_usr_list.append({"username":getuser_lists.username, "is_active":getuser_lists.is_active, "provider":social_pro})

    context= {'applications': applications, 'app_choices':app_choices, 'server_status':server_status, 'app_belongs':app_belongs, 'server_selections':server_selections, 'usersVal':getuser_list, "get_usr_list":get_usr_list}
    return render(request,"show_app.html", context)  

# Edit Application
@login_required(login_url='/accounts/login/')
def edit(request, id):  
    applications = Members.objects.get(id=id)

    # getting user list for this app
    getapp_pk = []
    get_usr_list = []
    addapp_appl_acc = Account.applications.through.objects.filter(members_id=id)
    for aaa in addapp_appl_acc:
        addapp_acc = Account.objects.get(id = aaa.account_id)
        getapp_pk.append(addapp_acc.user_id)

    getuser_list = User.objects.filter(id__in = getapp_pk)
    getprovider_chk = SocialAccount.objects.filter(user_id__in = getapp_pk)

    for getuser_lists in getuser_list:
        uname = getuser_lists.username
        getprovider_chk = SocialAccount.objects.filter(user_id = getuser_lists.id)
        social_pro = []
        for getprovider_chks in getprovider_chk:
            social_pro.append(getprovider_chks.provider)
        get_usr_list.append({"username":getuser_lists.username, "is_active":getuser_lists.is_active, "provider":social_pro})

    context= {'applications': applications, 'app_choices':app_choices, 'server_status':server_status, 'app_belongs':app_belongs, 'server_selections':server_selections, 'usersVal':getuser_list, 'getprovider_chk':getprovider_chk, "get_usr_list":get_usr_list}
    return render(request,'edit_app.html', context)
      
#Update Application
@login_required(login_url='/accounts/login/')
def update(request, id):  
    applications = Members.objects.get(id=id)  
    form = MemberForm(request.POST, request.FILES, instance = applications)  
    if form.is_valid():  
        form.save()  
        return HttpResponseRedirect("/app_config") 
    else:
        pass
    
    # getting user list for this app
    getapp_pk = []
    addapp_appl_acc = Account.applications.through.objects.filter(members_id=id)
    for aaa in addapp_appl_acc:
        addapp_acc = Account.objects.get(id = aaa.account_id)
        getapp_pk.append(addapp_acc.user_id)
    getuser_list = User.objects.filter(id__in = getapp_pk)

    context= {'applications': applications, 'app_choices':app_choices, 'server_status':server_status, 'app_belongs':app_belongs, 'server_selections':server_selections, 'usersVal':getuser_list}
    return render(request, 'edit_app.html', context)  

#Delete Application
@login_required(login_url='/accounts/login/ ')
def destroy(request, id):  
    applications = Members.objects.get(id=id)  
    applications.delete()  
    return HttpResponseRedirect("/app_config")  

# search
def search(request):
    search_val = request.POST.get('search')
    all = list(Members.objects.filter(name__icontains=search_val).values())
    return JsonResponse({"data": list(all)})

# check status in url and postgres
def check_status(url):
    import psycopg2
    # import MySQLdb as mariadb
    import urllib.request
    import requests
    status = ''
    if 'https://' in url:
        url = url
    else:
        url = 'http://'+url
    # database="Marine13_live", 
    # user='odoo', 
    # password='vvmarine@12+', 
    # host='192.168.52.112', 
    # port= '5432'
    # try:
    #     # db = psycopg2.connect(database=database, user=user, password=password, host=host, port= port)
    #     # mysqlconn = mariadb.connect(host=host, user=user, passwd=password, db=database)
    #     # mysqlconn = mariadb.connect(host="localhost", user='root', passwd='mariadb', db='vvmarine_erpnext')
    #     # print(mysqlconn,"mysqlconn")
    #     status = 'live'
    # except:
    #     status = 'dberror'
    # print(url,"dksdk")
    # try:
    #     server_check = urllib.request.urlopen(url).getcode()
    #     print(server_check,"server_check")
    #     if server_check == 200:
    #         status = 'live'
    #     if server_check == 500
    #     else:
    #         status = 'alpha'
    # except:
    #     status = 'alpha'
    # return status

    try:
        response = requests.get(url)

        # Check if the request was successful (status code 200)
        if response.status_code == 200:
            # Print the content of the web page
            status = 'live'
        else:
            status = 'dberror'

    except requests.exceptions.RequestException as e:
        status = 'alpha'

    return status







    




