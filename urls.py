from django.conf.urls.defaults import *
from django.contrib import admin

admin.autodiscover()

urlpatterns = patterns('',
    # Example:
    # (r'^deproc/', include('deproc.foo.urls')),

    (r'^admin/', include(admin.site.urls)),
)
