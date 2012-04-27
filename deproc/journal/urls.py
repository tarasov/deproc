# -*- coding: utf-8 -*-
from django.conf.urls.defaults import *
from django.contrib import admin
import os

admin.autodiscover()

urlpatterns = patterns('deproc.journal.views',
    url(r'^$', 'group'),
    url(r'^groups/$', 'groups', name='journal_groups'),
    url(r'^group/(\d+)/$', 'group', name='journal_group'),
    url(r'^group/(\d+)/disciplines/$', 'disciplines', name='disciplines'),
    # проверить можно ли discipline/a/b/
    url(r'^group/(\d+)/discipline/(.*)/$', 'select_discipline', name='select_discipline'),
    url(r'^mark/add/(\d+)/(\d+)/(\d+)/$', 'mark_add'),
)
