from django.conf.urls.defaults import *
from django.contrib import admin
import os

admin.autodiscover()

urlpatterns = patterns('deproc.journal.views',
    url(r'^$', 'show'),
    url(r'^groups/$', 'groups', name='journal_groups'),
    url(r'^group/(\d+)/$', 'group', name='journal_group'),
    url(r'^mark/add/(\d+)/(\d+)/(\d+)/$', 'mark_add'),
#    url(r'^lab/add/$', 'add_lab', name='add_lab'),
)
