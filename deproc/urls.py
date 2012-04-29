# -*- coding: utf-8 -*-
from django.conf.urls.defaults import *
from django.contrib import admin
from deproc.tariffication.views import actions
import settings

admin.autodiscover()

urlpatterns = patterns('deproc.tariffication.views',
    url(r'^$', 'wellcome', name='wellcome'),
    url(r'^tariffication/$', 'tariffication', name='tariffication'),
    url(r'^plan_group/$', 'plan_group', name='plan_group'),
)

# Расписание
urlpatterns += patterns('deproc.schedule.views',
    url(r'^schedule/$', 'schedule', name='schedule'),
    url(r'^schedule/index/', 'index', name='schedule_index'),
)

# Электронный журнал
urlpatterns += patterns('deproc.schedule.views',
    url(r'^journal/', include('deproc.journal.urls')),
)

# admin
urlpatterns += patterns('deproc.admin.views',
    url(r'^tariffication/add/$', 'add_tariffication', name='add_tariffication'),
    url(r'^plan_group/add/$', 'add_plan_group', name='add_plan_group'),
)

# pages
urlpatterns += patterns('',
    (r'^admin/', include(admin.site.urls)),
    (r'^admin/jsi18n/', 'django.views.i18n.javascript_catalog'),
)

urlpatterns += patterns('',
    (r'^media/(?P<path>.*)$', 'django.views.static.serve',
         { 'document_root': settings.PROJECT_ROOT +'/media/' }),
)



def get_urls():
    from django.conf.urls import patterns, url
    from deproc.tariffication.views import pages_list

    urls_list = patterns('',
        # в цикле добавим пути (urls)
    )

    for page_list in pages_list.keys():
        urls_list.append(url(r'^%s/$' % page_list, 'deproc.tariffication.views.pages', name='%s' % page_list))
        urls_list.append(url(r'^%s/add/$' % page_list, 'deproc.admin.views.add_page', name='%s_add' % page_list))
        # TODO сделать проверку на существование функции
        for action in actions:
            urls_list.append(url(r'^%s/(\d+)/%s/$' % (page_list, action, ), 'deproc.admin.views.%s_page' % action, name='%s_%s' % (action, page_list, )))
    return urls_list

urlpatterns += get_urls()
