from django.contrib.admin import ModelAdmin, site
from django.contrib.auth.models import User, Group
from django.contrib.sites.models import Site
from deproc.schedule import models

site.register(models.Absences)
site.register(models.Classroom)
site.register(models.Schedule)
site.register(models.Schedule_day)




