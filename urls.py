from django.conf.urls.defaults import *
from django.contrib import admin
from deproc.main import views

admin.autodiscover()

urlpatterns = patterns('',
    # Example:
    # (r'^deproc/', include('deproc.foo.urls')),
    (r'^$', views.wellcome),
    (r'^add/(.*)/$', views.action),
    (r'^admin/', include(admin.site.urls)),
)
