# -*- coding: utf-8 -*-
from django.conf.urls.defaults import *

url_select = r'^select/'
url_end = r'$'


urlpatterns = patterns('deproc.report.views',
    url(r'^$', 'report_all', name='report_all'),
    url(r'^selected/$', 'select', name='select'),
    url(r'^selected/(\d+)/$', 'select', name='select_teacher'),
)