# -*- coding: utf-8 -*-
from django.db import models
from deproc.tariffication import models as main_models
from deproc.schedule.models import Schedule_day


class Types_themes(models.Model):
    name = models.CharField(u"Название", max_length=150, null=False, blank=False)

    class Meta:
        verbose_name = ('тип темы')
        verbose_name_plural = ('типы тем')
        db_table = 'types_themes'

    def __unicode__(self):
        return u'%s' % self.name


class Journal_day(models.Model):
    describe    = models.CharField("Название", max_length=255, null = False, blank = False)
    day = models.ForeignKey(Schedule_day, verbose_name='День')

    class Meta:
        verbose_name = ('день')
        verbose_name_plural = ('дни')
        db_table = 'journal_day'

    def __unicode__(self):
        return u'%s' % self.describe

# Оценки
class Assessment(models.Model):
    mark       = models.IntegerField("Оценка", null=False, blank=False)
    student    = models.ForeignKey(main_models.Students, verbose_name='Студент')
    day        = models.ForeignKey(Schedule_day, verbose_name='День занятия')
    date_pub   = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = ('оценку')
        verbose_name_plural = ('оценки')
        db_table = 'assessment'

    def __unicode__(self):
        return u'%s' % self.mark