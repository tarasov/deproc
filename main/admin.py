from django.contrib.admin import ModelAdmin, site
from main import models

__author__ = 'tarasov'

class AdminUser(ModelAdmin):
    fields = ('username', 'first_name', 'last_name', 'other_name', 'email', 'password', 'phone', 'b_day', 'sex', 'groups',)

class AdminGroup(ModelAdmin):
    pass

class AdminUserStatus(ModelAdmin):
    pass

class AdminPost(ModelAdmin):
    list_display = ('user', 'get_user_status')


site.register(models.User, AdminUser)
site.register(models.Group, AdminGroup)
site.register(models.UserStatus, AdminUserStatus)
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
site.register(models.Year)
site.register(models.Tariffication)


