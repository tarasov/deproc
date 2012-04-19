# -*- coding: utf-8 -*-
from django.db import models
from deproc.main.models import Profile

class Themes(models.Model):
    name    = models.CharField("Название", max_length=255, null = False, blank = False)

    class Meta:
        db_table = u'labs'
        verbose_name = ('тему')
        verbose_name_plural = ('темы')

    def __unicode__(self):
        return u'%s' % self.name


class Assessment(models.Model):
    student  = models.IntegerField(choices=Profile().get_students())
    theme    = models.ForeignKey(Themes, related_name='assessments')
    mark     = models.IntegerField("Оценка", null=False, blank=False)
    date_pub = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = ('оценку')
        verbose_name_plural = ('оценки')

    def __unicode__(self):
        return u'%s' % self.mark