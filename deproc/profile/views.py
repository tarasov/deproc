# -*- coding: utf-8 -*-
import datetime
from django.contrib.auth.models import User
from django.contrib.auth.views import login, logout
from django.shortcuts import render_to_response
from django.http import HttpResponseRedirect, HttpResponseServerError, HttpResponse, HttpResponseNotFound
from django.template import RequestContext
from django.core.urlresolvers import reverse
from django.template.defaulttags import csrf_token
from deproc.tariffication import forms, models
from deproc.profile import forms as profile_forms

def registration(request):

#    student = User()
#    studentProfile = Students()
#    if request.method == "POST":
#        studentForm = StudentsForm(request.POST, instance = student)
#        studentProfileForm = StudentsProfileForm(request.POST, instance = studentProfile)
#        if studentForm.is_valid() and studentProfileForm.is_valid():
#            userData = studentForm.cleaned_data
#            student.username = userData['username']
#            student.last_name = userData['last_name']
#            student.first_name = userData['first_name']
#            student.set_password(userData['pass1'])
#            student.save()
#            st = User.objects.get(pk = student.pk)
#
#            studentProfile = student.get_profile()
#            studentProfileData = studentProfileForm.cleaned_data
#            #            studentProfile.user = st
#            studentProfile.other_name = studentProfileData['other_name']
#            studentProfile.b_day = studentProfileData['b_day']
#            studentProfile.phone = studentProfileData['phone']
#            studentProfile.sex = studentProfileData['sex']
#            studentProfile.cart = studentProfileData['cart']
#            studentProfile.is_elder = studentProfileData['is_elder']
#            studentProfile.save()
#            user = authenticate(username = userData['username'], password = userData['pass1'] )
#            login(request, user)
#            return HttpResponseRedirect('/')
#    else:
#        studentForm = StudentsForm(instance = student)
#        studentProfileForm = StudentsProfileForm(instance = studentProfile)

    return render_to_response("profile/registration.html", locals(), context_instance = RequestContext(request))


def profile(request, pk = None):
    if not pk:
        pk = request.user.pk
    today = datetime.datetime.today().strftime("%d.%m.%Y")

    if models.Teachers.objects.filter(id=pk):
        teacher = models.Teachers.objects.get(id=pk)
        return render_to_response('profile/teacher.html', locals(), context_instance=RequestContext(request))
    else:
        # TODO предусмотреть профиль других пользователей (admin, is_staff,)
        try:
            student = models.Students.objects.get(id=pk)
        except:
            pass
        else:
            student = User.objects.get(id=pk)
        return render_to_response('profile/student.html', locals(), context_instance=RequestContext(request))

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

def logout_user(request):
    logout(request)
    return HttpResponseRedirect(reverse('wellcome'))

def login_user(request):
    login(request)
    return HttpResponseRedirect(request.META['HTTP_REFERER'])
