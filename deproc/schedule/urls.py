# -*- coding: utf-8 -*-
from django.conf.urls.defaults import *

url_lesson = r'^lesson/(?P<year>\d{4})-(?P<month>\d{1,2})-(?P<day>\d{1,2})/(?P<group>\d{3})/(?P<lesson>\d{1})/'
url_lesson_add = r'add/(?P<plan>\d+)/(?P<count_hours>\d{1})/'
url_lesson_del = r'delete/(?P<id_lesson>\d+)/'
url_end = r'$'


urlpatterns = patterns('deproc.schedule.views',
    url(r'^$', 'index_now', name='schedule'),
    url(r'^choose/(?:(?P<id_profile>\d+)/)?$', 'index', name='schedule_index'),
    url(url_lesson + url_end, 'lesson'),
    url(url_lesson + url_lesson_add + url_end, 'add_lesson'),
    url(url_lesson + url_lesson_del + url_end, 'delete_lesson')
)