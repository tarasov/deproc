from django.conf.urls.defaults import *
from django.contrib import admin

admin.autodiscover()

urlpatterns = patterns('main.views',
    url(r'^$', 'wellcome'),
    url(r'^add/(.*)/$', 'action'),
    url(r'^tarification/', 'tarification', name='tarification')
)

urlpatterns += patterns('',
    (r'^admin/', include(admin.site.urls)),
)