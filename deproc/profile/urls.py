# -*- coding: utf-8 -*-
from django.conf.urls.defaults import *
from django.contrib import admin
from deproc.tariffication.views import actions

# Аккаунт
urlpatterns = patterns('deproc.profile.views',
    url(r'^$', 'profile', name='profile'),
    url(r'^(teachers|students)/$', 'users', name='profiles'),
    url(r'^(\d+)/$', 'user', name='user'),
    url(r'^group/(\d+)/$', 'group', name='profile_group'),
    url(r'^settings/$', 'settings', name='settings'),
#    url(r'^logout/$', 'logout_user', name='logout'),
#    url(r'^login/$', 'login_user', name='login'),
)