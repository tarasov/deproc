from django.conf.urls.defaults import *
from django.contrib import admin
import settings

admin.autodiscover()

urlpatterns = patterns('deproc.main.views',
    url(r'^$', 'wellcome'),
    url(r'^add/(.*)/$', 'action'),
    url(r'^tariffication/', 'tariffication', name='tariffication')
)

urlpatterns += patterns('deproc.schedule.views',
    url(r'^schedule/', 'schedule', name='schedule'),
)


urlpatterns += patterns('',
    (r'^admin/', include(admin.site.urls)),
)

urlpatterns += patterns('',
    (r'^media/(?P<path>.*)$', 'django.views.static.serve',
         { 'document_root': settings.PROJECT_ROOT +'/media/' }),
)
