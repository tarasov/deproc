from django.contrib.admin import site
from models import Assessment, Theme_of_day

site.register(Assessment)
site.register(Theme_of_day)
