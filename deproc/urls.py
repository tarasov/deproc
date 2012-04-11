from django.conf.urls.defaults import *
from django.contrib import admin
import settings

admin.autodiscover()

urlpatterns = patterns('deproc.main.views',
    url(r'^$', 'wellcome'),
    url(r'^tariffication/$', 'tariffication', name='tariffication'),
    url(r'^plan_group/$', 'plan_group', name='plan_group'),
)

urlpatterns += patterns('deproc.schedule.views',
    url(r'^schedule/$', 'schedule', name='schedule'),
    url(r'^schedule/index/', 'index', name='schedule_index'),
)

# admin
urlpatterns += patterns('deproc.admin.views',
    url(r'^tariffication/add/$', 'add_tariffication', name='add_tariffication'),
)



urlpatterns += patterns('',
    (r'^admin/', include(admin.site.urls)),
    (r'^admin/jsi18n/', 'django.views.i18n.javascript_catalog'),
)

urlpatterns += patterns('',
    (r'^media/(?P<path>.*)$', 'django.views.static.serve',
         { 'document_root': settings.PROJECT_ROOT +'/media/' }),
)
