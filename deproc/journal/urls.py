# -*- coding: utf-8 -*-
from django.conf.urls.defaults import *
from django.contrib import admin
import os

admin.autodiscover()

urlpatterns = patterns('deproc.journal.views',
    url(r'^$', 'groups'),
    url(r'^groups/$', 'groups', name='journal_groups'),
    url(r'^group/(\d+)/$', 'group', name='journal_group'), # лишний урл
    url(r'^group/(\d+)/disciplines/$', 'disciplines', name='disciplines'),
    # проверить можно ли discipline/a/b/
    url(r'^group/(\d+)/discipline/(\d+)/$', 'group', name='group'),
    url(r'^mark/add/(\d+)/(\d+)/(\d+)/$', 'mark_add'),
)
