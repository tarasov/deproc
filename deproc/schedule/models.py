# -*- coding: utf-8 -*-
from django.db import models
from deproc.main import models as main_models

#from deproc.main.models import Profile, Tariffication

class Classroom(models.Model):
    number = models.IntegerField(max_length=100, null=False, blank=False)

    class Meta:
        verbose_name = u'кабинет'
        verbose_name_plural = u'кабинеты'

    def __unicode__(self):
        return u'%s' % self.number

class Schedule_day(models.Model):
    day = models.DateField(max_length=100, null=True, blank=True,)
    real = models.BooleanField()

    class Meta:
        verbose_name = u'день расписания'
        verbose_name_plural = u'дни расписания'

    def __unicode__(self):
        return u'%s (%s)' % (self.day, self.real)

class Schedule(models.Model):
    plan = models.ForeignKey(main_models.Tariffication, verbose_name=u"тарификация")
    day = models.ForeignKey(Schedule_day, verbose_name=u"день")
    classroom = models.ForeignKey(Classroom, verbose_name=u"кабинет")
    num_less = models.IntegerField(verbose_name=u"номер")

    class Meta:
        verbose_name = u'расписание'
        verbose_name_plural = u'расписания'

    def __unicode__(self):
        return u'%s, %s, %s, %s, %s' % (self.plan.set_teacher, self.plan.uch_plan_hour.uch_plan.disc, self.plan.group_plan.group, self.day, self.num_less)

class Absences(models.Model):
    schedule = models.ForeignKey(Schedule)
    student = models.CharField(u"Студент", max_length=100, null=True, blank=True, choices=main_models.Profile().get_students())
    absence = models.CharField(max_length=10, null=True, blank=True)

    class Meta:
        verbose_name = u'пропуск'
        verbose_name_plural = u'пропуски'

    def __unicode__(self):
        return u'%s, %s' % (self.schedule, self.student)