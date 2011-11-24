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
    list_display = ('user', 'status', 'get_user_posts')


site.register(models.User, AdminUser)
site.register(models.Group, AdminGroup)
site.register(models.UserStatus, AdminUserStatus)
site.register(models.Post, AdminPost)
