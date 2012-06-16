from django.contrib.admin import ModelAdmin, site
from deproc.schedule import models

site.register(models.Absences)
site.register(models.Classroom)
site.register(models.Schedule)
site.register(models.Schedule_day)







