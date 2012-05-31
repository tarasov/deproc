# -*- coding: utf-8 -*-
from django.contrib.auth.views import login, logout
from django.shortcuts import render_to_response
from django.http import HttpResponseRedirect, HttpResponseServerError, HttpResponse, HttpResponseNotFound
from django.template import RequestContext
from django.core.urlresolvers import reverse
from django.template.defaulttags import csrf_token
from deproc.tariffication import forms, models



def profile(request):
    return render_to_response('profile/profile.html', locals(), context_instance=RequestContext(request))

def settings(request):
    return render_to_response('profile/settings.html', locals(), context_instance=RequestContext(request))

def logout_user(request):
    logout(request)
    return HttpResponseRedirect(reverse('wellcome'))

def login_user(request):
    login(request)
    return HttpResponseRedirect(reverse('wellcome'))
