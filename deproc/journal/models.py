# -*- coding: utf-8 -*-
from django.db import models
from deproc.tariffication import models as main_models
from deproc.schedule.models import Schedule_day, Schedule


class Theme_of_day(models.Model):
    day_of_schedule = models.ForeignKey(Schedule, verbose_name='День') # день из расписания
    describe = models.CharField("Название", max_length=255, null = False, blank = False)

    class Meta:
        verbose_name = ('день')
        verbose_name_plural = ('дни')
        db_table = 'theme_of_day'

    def __unicode__(self):
        return u'%s' % self.describe

# Оценки
class Assessment(models.Model):
    mark = models.IntegerField("Оценка", null=False, blank=False)
    student = models.ForeignKey(main_models.Students, verbose_name='Студент')
    theme_of_day = models.ForeignKey(Theme_of_day, verbose_name='Тема занятия')
    date_pub = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = ('оценку')
        verbose_name_plural = ('оценки')
        db_table = 'assessment'

    def __unicode__(self):
        return u'%s' % self.mark