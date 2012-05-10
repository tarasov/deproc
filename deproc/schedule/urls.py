# -*- coding: utf-8 -*-
from django.conf.urls.defaults import *
from django.contrib import admin
import os

admin.autodiscover()

urlpatterns = patterns('deproc.schedule.views',
    url(r'^calendar/$', 'schedule', name='schedule'),
    url(r'^index$', 'index', name='schedule_index'),
    #    url(r'^schedule/edit/(?P<year>\d{4})-(?P<month>\d{2})-(?P<day>\d{4})/(?P<group>\d{3})/(?P<lesson>\d{1})/$', 'edit_lesson'),
)