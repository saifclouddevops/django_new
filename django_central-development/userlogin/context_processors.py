from userlogin.models import myProfile

def add_variable_to_context(request):
    return {'user_profile': myProfile.objects.filter(user_id = request.user.id)} 