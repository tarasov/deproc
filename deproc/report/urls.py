# -*- coding: utf-8 -*-
from django.conf.urls.defaults import *
from django.contrib import admin
import os

admin.autodiscover()


url_select = r'^select/'
url_end = r'$'


urlpatterns = patterns('deproc.report.views',
    url(r'^$', 'report_all', name='report_all'),
    url(r'^selected/$', 'select', name='select'),
    url(r'^selected/(\d+)/$', 'select', name='select_teacher'),
    #    url(url_lesson + url_lesson_add + url_end, 'add_lesson'),
#    url(url_lesson + url_lesson_del + url_end, 'delete_lesson')
)