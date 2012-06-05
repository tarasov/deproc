# -*- coding: utf-8 -*-
import datetime
from django.contrib.auth.views import login, logout
from django.shortcuts import render_to_response
from django.http import HttpResponseRedirect, HttpResponseServerError, HttpResponse, HttpResponseNotFound
from django.template import RequestContext
from django.core.urlresolvers import reverse
from django.template.defaulttags import csrf_token
from deproc.tariffication import forms, models
from deproc.profile import forms as profile_forms



def profile(request):
    teacher = models.Teachers.objects.get(id=request.user.pk)
    today = datetime.datetime.today().strftime("%d.%m.%Y")
    return render_to_response('profile/profile.html', locals(), context_instance=RequestContext(request))

def users(request, who):
    if who == 'teachers':
        users = models.Teachers.objects.all()
    else:
        users = models.Students.objects.all()
    return render_to_response('profile/users.html', locals(), context_instance=RequestContext(request))

def user(request, user):
    if models.Teachers.objects.filter(id=user):
        user = models.Teachers.objects.get(pk = user)
        form = profile_forms.TeacherForm()
    elif models.Students.objects.filter(id=user):
        user = models.Students.objects.get(pk = user)
        form = profile_forms.StudentForm()

    return render_to_response('profile/user.html', locals(), context_instance=RequestContext(request))

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
