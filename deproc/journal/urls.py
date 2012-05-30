# -*- coding: utf-8 -*-
from django.conf.urls.defaults import *
from django.contrib import admin
import os

admin.autodiscover()
urlpatterns = patterns('deproc.journal.views',
    url(r'^$',
        'teachers', name='teachers'
    ),
    url(r'^(?P<teacher>\d+)/groups/$',
        'groups', name='groups'
    ),
    url(r'^(?P<teacher>\d+)/group/(?P<group>\d+)/disciplines/$',
        'disciplines', name='disciplines'
    ),
    url(r'^(?P<teacher>\d+)/group/(?P<group>\d+)/discipline/(?P<discipline>\d+)/$',
        'journal', name='journal'
    ),
    url(r'^\d+/group/\d+/discipline/\d+/add_theme/(\d+)/$',
        'add_theme_of_day', name='add_theme_of_day'
    ),
    url(r'^\d+/group/\d+/discipline/\d+/add_mark/(\d+)/(\d+)/(\d+)/$',
        'add_mark'
    ),
)




