# -*- coding: utf-8 -*-
import datetime
from django.contrib.auth import authenticate
from django.contrib.auth.models import User
from django.contrib.auth.views import login, logout
from django.shortcuts import render_to_response
from django.http import HttpResponseRedirect, HttpResponseServerError, HttpResponse, HttpResponseNotFound
from django.template import RequestContext
from django.core.urlresolvers import reverse
from django.template.defaulttags import csrf_token
from deproc.profile.forms import StudentsForm
from deproc.tariffication import forms, models
from deproc.profile import forms as profile_forms
from deproc.tariffication.models import Students

def registration(request):

    student = Students()
    if request.method == "POST":
        studentForm = StudentsForm(request.POST)
        if studentForm.is_valid():
            userData = studentForm.cleaned_data
            student.username = userData['username']
            student.last_name = userData['last_name']
            student.first_name = userData['first_name']
            student.other_name = userData['other_name']
            student.b_day = userData['b_day']
            student.phone = userData['phone']
            student.sex = userData['sex']
            student.cart = userData['cart']
            student.is_elder = userData['is_elder']
            student.set_password(userData['pass1'])
            student.save()
            user = authenticate(username = userData['username'], password = userData['pass1'] )
            login(request, user)
            return HttpResponseRedirect('/')
        else:
            studentForm = StudentsForm(request.POST)
    else:
        studentForm = StudentsForm()

    return render_to_response("profile/registration.html", locals(), context_instance = RequestContext(request))


def profile(request, pk = None):
    # TODO создать декаратор
    if not User.objects.filter(id=request.user.id):
        return HttpResponseRedirect(reverse('deproc'))
    # END TODO создать декаратор

    if not pk:
        pk = request.user.pk
    today = datetime.datetime.today().strftime("%d.%m.%Y")

    if models.Teachers.objects.filter(user_ptr = pk):
        teacher = models.Teachers.objects.get(user_ptr = pk)
        return render_to_response('profile/teacher.html', locals(), context_instance=RequestContext(request))
    elif models.Students.objects.filter(user_ptr = pk):
        # TODO предусмотреть профиль других пользователей (admin, is_staff,)
        student = models.Students.objects.get(user_ptr = pk)
        return render_to_response('profile/student.html', locals(), context_instance=RequestContext(request))
    else:
        return HttpResponseRedirect(reverse('deproc'))

def users(request, who):
    if who == 'teachers':
        users = models.Teachers.objects.all()
    else:
        users = models.Students.objects.all()
    return render_to_response('profile/users.html', locals(), context_instance=RequestContext(request))

def user(request, pk):
    return profile(request, pk)
#    if models.Teachers.objects.filter(id=user):
#        user = models.Teachers.objects.get(pk = user)
#        form = profile_forms.TeacherForm()
#    elif models.Students.objects.filter(id=user):
#        user = models.Students.objects.get(pk = user)
#        form = profile_forms.StudentForm()

#    return render_to_response('profile/user.html', locals(), context_instance=RequestContext(request))

def group(request, group):
    group = models.Groups_stud.objects.get(pk = group)
    return render_to_response('profile/group.html', locals(), context_instance=RequestContext(request))

def settings(request):
    return render_to_response('profile/settings.html', locals(), context_instance=RequestContext(request))
