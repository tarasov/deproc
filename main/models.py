# -*- coding: utf-8 -*-
from django.contrib.auth.models import User, Group
from django.db import models

choise_sex = (
    ('M', 'мужик',),
    ('B', 'баба',)
)

class Group(Group):
    describe = models.CharField(u"Описание", max_length=150 )

    class Meta:
            verbose_name = u'группа'
            verbose_name_plural = u'группы'

class User(User):
    other_name = models.CharField(u"Отчество", max_length=100, null=True, blank=True )
    b_day = models.DateField(u"День рождения", null=True, blank=True )
    phone = models.CharField(u"Телефон", max_length=100, null=True, blank=True )
    sex = models.CharField(u"Пол", max_length=100, null=True, blank=True, choices=choise_sex)

    class Meta:
            verbose_name = u'пользователь'
            verbose_name_plural = u'пользователи'

class UserStatus(models.Model):
    name = models.CharField(u"Статус", max_length=100, null=False, blank=False )

    class Meta:
            verbose_name = u'статус'
            verbose_name_plural = u'статусы'

    def __unicode__(self):
        return u'%s' % self.name


class Post(models.Model):
    user = models.ForeignKey(User, verbose_name="Пользователь")
    status = models.ForeignKey(UserStatus, verbose_name="Статус")
    user_post = models.ManyToManyField(Group)

    def get_user_posts(self):
        posts = []
        for post in self.user_post.filter(): posts.append(post.name)
        return posts

    def teachers(self):
        return Post.objects.filter(user_post=self).count()

    class Meta:
        verbose_name = u'должность'
        verbose_name_plural = u'должности'

    def __unicode__(self):
        return u'%s' % self.user_post
    
#from main import models
#user = models.User.objects.all()[0]
#models.Post.objects.get(user=user).teachers()
