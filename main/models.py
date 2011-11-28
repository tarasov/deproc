# -*- coding: utf-8 -*-
from django.contrib.auth.models import User, Group
from django.db import models

choise_sex = (
    ('M', 'мужик',),
    ('B', 'баба',)
)


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
#        self.group_name = Group.objects.filter(status=self.pk)
#        return u'%s %s' % (self.name, self.group_name)

        self.group_name = Group.objects.filter(status=self.pk)[0]
        return u'%s %s' % (self.name, self.group_name)

class Group(Group):
    describe = models.CharField(u"Описание", max_length=150 )
    status = models.ManyToManyField(UserStatus, verbose_name="Статусы")

    class Meta:
            verbose_name = u'группа'
            verbose_name_plural = u'группы'

    def __unicode__(self):
        return u'%s' % (self.name, )

class UserPost(models.Model):
    user = models.ForeignKey(User, verbose_name="Пользователь")
    status = models.ManyToManyField(UserStatus, verbose_name="Статус")
    date_begin = models.DateField("Дата начала", null=False,blank=False)
    date_end = models.DateField("Дата", null=True, blank=True)


#    UserPost.objects.filter()[0].status.all(), UserPost.objects.get(user=UserPost.objects.filter()[0].user).date_begin
    #for status in post.status.all():
    #     print status, UserPost.objects.get(user=post.user).date_begin
    def get_user_status(self):
        post = []
        for p in self.status.filter(): post.append(p.name)
        return post
#
#    def teachers(self):
#        return Post.objects.filter(user_post=self).count()

    class Meta:
        verbose_name = u'должность'
        verbose_name_plural = u'должности'

    def __unicode__(self):
        return u'%s' % self.user

class HistoryStatus(models.Model):
    status = models.ForeignKey(UserPost)
