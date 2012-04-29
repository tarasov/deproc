# -*- coding: utf-8 -*-
from django.db import models
from deproc.main import models as main_models


class Types_themes(models.Model):
    name = models.CharField(u"Название", max_length=150, null=False, blank=False)

    class Meta:
        verbose_name = ('тип темы')
        verbose_name_plural = ('типы тем')
        db_table = 'types_themes'

    def __unicode__(self):
        return u'%s' % self.name


class Themes(models.Model):
    describe    = models.CharField("Название", max_length=255, null = False, blank = False)
    tariffication = models.ForeignKey(main_models.Tariffication, verbose_name='Тариффикация')
    type = models.ForeignKey(Types_themes, verbose_name='Тип темы')
    date_pub = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = ('тему')
        verbose_name_plural = ('темы')
        db_table = 'themes'

    def __unicode__(self):
        return u'%s' % self.describe

# Оценки
class Assessment(models.Model):
    mark       = models.IntegerField("Оценка", null=False, blank=False)
    student    = models.IntegerField(choices=main_models.Profile().get_students())
    theme      = models.ForeignKey(Themes, verbose_name='Тема занятия')
    date_pub   = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = ('оценку')
        verbose_name_plural = ('оценки')
        db_table = 'assessment'

    def __unicode__(self):
        return u'%s' % self.mark