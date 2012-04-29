from django.contrib.admin import ModelAdmin, site
from django.contrib.auth.models import User, Group
from django.contrib.sites.models import Site
from deproc.tariffication import models

__author__ = 'tarasov'

class AdminUser(ModelAdmin):
    fields = ('username', 'first_name', 'last_name', 'other_name', 'email', 'password', 'phone', 'b_day', 'sex', 'groups',)

class AdminUserStatus(ModelAdmin):
    pass

class AdminPost(ModelAdmin):
    list_display = ('user', 'get_user_status')

#site.unregister(User)
#site.unregister(Group)
site.unregister(Site)

site.register(models.Profile, AdminUser)
site.register(models.Students)
site.register(models.Teachers)
site.register(models.Group)
site.register(models.UserStatus)
site.register(models.UserPost, AdminPost)
site.register(models.PO)
site.register(models.Speciality)
site.register(models.UchPlan)
site.register(models.UchPlanHour)
site.register(models.Discipline)
site.register(models.Disc_type)
site.register(models.Groups)
site.register(models.Groups_stud)
site.register(models.Groups_plan)
site.register(models.Tariffication)
site.register(models.Year)
