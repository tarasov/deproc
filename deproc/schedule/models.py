# -*- coding: utf-8 -*-
from django.db import models, connection
from deproc.tariffication.models import Tariffication, Groups, Students, Classroom


class Schedule_day(models.Model):
    day = models.DateField(max_length=100, null=True, blank=True,)
    real = models.BooleanField()

    class Meta:
        verbose_name = u'день расписания'
        verbose_name_plural = u'дни расписания'
        db_table = 'schedule_day'

    def __unicode__(self):
        return u'%s' % (self.day.strftime('%m.%d'), )


class Schedule(models.Model):

    LESSON_CHOICES = (
        (1, u'1 пара'),
        (2, u'2 пара'),
        (3, u'3 пара'),
        (4, u'4 пара'),
        (5, u'5 пара'),
        )

    HOUR_CHOICES = (
        (1, u'1 час'),
        (2, u'2 часа'),
        )

    plan = models.ForeignKey(Tariffication, verbose_name=u"тарификация")
    day = models.ForeignKey(Schedule_day, verbose_name=u"день")
    classroom = models.ForeignKey(Classroom, verbose_name=u"кабинет", null=True, blank=True)
    num_less = models.IntegerField(verbose_name=u"номер", choices=LESSON_CHOICES)
    count_hours = models.IntegerField(verbose_name=u"часов в паре", choices=HOUR_CHOICES)
    comment = models.TextField(verbose_name=u"комментарий", null=True, blank=True)

    class Meta:
        verbose_name = u'расписание'
        verbose_name_plural = u'расписания'
        db_table = 'schedule'

    def get_group(self):
        return self.plan.group_plan.group

    def get_disc(self):
        return self.plan.uch_plan_hour.uch_plan.disc

    def __unicode__(self):
        return u'%s, %s, %s, %s, %s' % (self.plan.teacher, self.plan.uch_plan_hour.uch_plan.disc, self.plan.group_plan.group, self.day.day, self.num_less)

class Absences(models.Model):
    schedule = models.ForeignKey(Schedule)
    student = models.ForeignKey(Students, verbose_name='Студент')
    absence = models.CharField(max_length=10, null=True, blank=True)

    class Meta:
        verbose_name = u'пропуск'
        verbose_name_plural = u'пропуски'
        db_table = 'absences'

    def __unicode__(self):
        return u'%s, %s' % (self.schedule, self.student)
