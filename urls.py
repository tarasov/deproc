from django.conf.urls.defaults import *
from django.contrib import admin
from deproc.main.views import wellcome

admin.autodiscover()

urlpatterns = patterns('',
    # Example:
    # (r'^deproc/', include('deproc.foo.urls')),
    (r'^$', wellcome),
    (r'^admin/', include(admin.site.urls)),
)
