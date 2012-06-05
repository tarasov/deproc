# -*- coding: utf-8 -*-
from django.conf.urls.defaults import *
from django.contrib import admin
from deproc.tariffication.views import actions
import settings

admin.autodiscover()

urlpatterns = patterns('deproc.tariffication.views',
    url(r'^$', 'wellcome', name='wellcome'),
    url(r'^tariffication/$', 'tariffication', name='tariffication'),
    url(r'^group_plan/$', 'group_plan', name='group_plan'),
)

# Расписание
urlpatterns += patterns('',
    url(r'schedule/', include('deproc.schedule.urls'))
)

# Графики
urlpatterns += patterns('',
    url(r'report/', include('deproc.report.urls'))
)

# Электронный журнал
urlpatterns += patterns('',
    url(r'^journal/', include('deproc.journal.urls')),
)

# Аккаунт
urlpatterns += patterns('',
    url(r'^profile/', include('deproc.profile.urls')),
)

# admin
urlpatterns += patterns('deproc.admin.views',
    url(r'^tariffication/(add)/$', 'add_tariffication', name='add_tariffication'),
    url(r'^tariffication/(edit)/(.*)/(.*)/(.*)/(.*)/$', 'add_tariffication', name='edit_tariffication'),
    url(r'^plan_group/add/$', 'add_plan_group', name='add_plan_group'),
)

urlpatterns += patterns('',
    (r'^admin/', include(admin.site.urls)),
    (r'^admin/jsi18n/', 'django.views.i18n.javascript_catalog'),
)

urlpatterns += patterns('',
    (r'^media/(?P<path>.*)$', 'django.views.static.serve',
         { 'document_root': settings.PROJECT_ROOT +'/media/' }),
)


urlpatterns += patterns('',
    url(r'^([a-z_]+)/$', 'deproc.tariffication.views.pages'),
    url(r'^(?P<page>[a-z_]+)/(?P<action>add)/$', 'deproc.admin.views.action_page'),
    # эта урл только для генерации ссылки на info && edit
    url(
        r'^(?P<page>[a-z_]+)/(?P<pk>\d+)/$',
        'deproc.admin.views.action_page',
        name = 'action_page',
    ),
    url(
        r'^(?P<page>[a-z_]+)/(?P<pk>\d+)/(?P<action>[a-z]+)$',
        'deproc.admin.views.action_page',
    ),
)