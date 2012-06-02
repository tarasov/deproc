# -*- coding: utf-8 -*-
from django.conf.urls.defaults import *
from django.contrib import admin
import os

admin.autodiscover()


url_teacher = r'^teacher/(?P<id_teacher>\d+)/'
url_end = r'$'


urlpatterns = patterns('deproc.report.views',
    url(url_end, 'report_all', name='report_all'),
#    url(url_teacher, 'report', name='report')
#    url(r'^index$', 'index', name='schedule_index'),
#    url(url_lesson + url_end, 'lesson'),
#    url(url_lesson + url_lesson_add + url_end, 'add_lesson'),
#    url(url_lesson + url_lesson_del + url_end, 'delete_lesson')
)