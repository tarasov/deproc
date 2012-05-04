from django.contrib.admin import ModelAdmin, site
from django.contrib.auth.models import User, Group
from deproc.schedule import models

site.register(models.Absences)
site.register(models.Classroom)
site.register(models.Schedule)
site.register(models.Schedule_day)
#site.register(models.Schedule_empty)
#site.register(models.Schedule_filled)







