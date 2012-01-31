# -*- coding: utf-8 -*-
from django.contrib.auth.models import User, Group
from django.db import models

choise_sex = (
    ('M', 'мужик',),
    ('B', 'баба',)
)

choice_otch = (
    ('E', 'экзамен',),
    ('Z', 'зачет',)
)
 
choice_typeh = (
    ('L', 'лекция',),
    ('P', 'практика',),
    ('S', 'консультация',)
)

st = User.objects.filter(groups__name="Students")
students = [(s.pk, s.username) for s in st]

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

#        self.group_name = Group.objects.filter(status=self.pk)[0]
        return u'%s' % (self.name,)



class Group(Group):
    describe = models.CharField(u"Описание", max_length=150 )
    status = models.ManyToManyField(UserStatus, verbose_name="Статусы")

    class Meta:
            verbose_name = u'группа'
            verbose_name_plural = u'группы'

    def __unicode__(self):
        return u'%s' % (self.name)

class UserPost(models.Model):
    user = models.ForeignKey(User, verbose_name="Пользователь")
    status = models.ManyToManyField(UserStatus, verbose_name="Статус")
    date_begin = models.DateField("Дата начала", null=False,blank=False)
    date_end = models.DateField("Дата", null=True, blank=True)

    def get_user_status(self):
        post = []
        for p in self.status.filter(): post.append(p.name)
        return post

    class Meta:
        verbose_name = u'должность'
        verbose_name_plural = u'должности'

    def __unicode__(self):
        return u'%s' % self.user

class HistoryStatus(models.Model):
    status = models.ForeignKey(UserPost)

    class Meta:
        verbose_name = u'история'
        verbose_name_plural = u'истории'

    def __unicode__(self):
        return u'%s' % self.status


class PO(models.Model):
    name = models.CharField(u"Профессиональное образование", max_length=150, null=False, blank=False)

    class Meta:
        verbose_name = u'профессиональное образование'
        verbose_name_plural = u'профессиональное образование'

    def __unicode__(self):
        return u'%s' % (self.name, )

class Speciality(models.Model):
    name = models.CharField(u"Специальность", max_length=150, null=False, blank=False)
    num_spec = models.FloatField(u"Норер специальности",  max_length=100)

    class Meta:
        verbose_name = u'специальность'
        verbose_name_plural = u'специальности'

    def __unicode__(self):
        return u'%s %s' % (self.name, self.num_spec)

class Disc_type(models.Model):
    name = models.CharField(u"Тип дисциплины", max_length=150, null=False, blank=False)

    class Meta:
        verbose_name = u'тип дисциплины'
        verbose_name_plural = u'типы дисциплины'

    def __unicode__(self):
        return u'%s' % (self.name, )

class Discipline(models.Model):
    name = models.CharField(u"Дисциплина", max_length=150, null=False, blank=False) # Программное обеспечени компьютерных сетей
    short_name = models.CharField(u"Короткое название", max_length=100, null=False, blank=False) # ПОКС
    id_type = models.ForeignKey(Disc_type, verbose_name=u"Тип часа") # лекция, практика, консультация

    class Meta:
        verbose_name = u'дисциплина'
        verbose_name_plural = u'дисциплины'

    def __unicode__(self):
        return u'%s' % (self.short_name, )


class UchPlan(models.Model):
    id_disc = models.ForeignKey(Discipline, verbose_name=u"Дисциплина")
    id_spec = models.ForeignKey(Speciality, verbose_name=u"Специальность")
    semestr = models.IntegerField(u"Семестр", max_length=100)
    otch = models.CharField(u"Отчетность", max_length=100, null=True, blank=True, choices=choice_otch)

    class Meta:
        verbose_name = u'учебный план'
        verbose_name_plural = u'учебные планы'

class UchPlanHour(models.Model):
    id_uch_plan = models.ForeignKey(UchPlan, verbose_name="Учебный план", max_length=100) # учебный план
    type = models.CharField(u"Тип часа", max_length=100, null=True, blank=True, choices=choice_typeh) # лекция, практика, консультация
    count_hours = models.IntegerField(u"Количество часов", max_length=100)

    class Meta:
        verbose_name = u'час учебного плана'
        verbose_name_plural = u'часы учебного плана'

class Year(models.Model):
    date_begin = models.DateField(u"Начало учебного года", null=False, blank=False) # 1.08.11
    date_end = models.DateField(u"Конец учебного года", null=False, blank=False) # 30.06.12

    class Meta:
        verbose_name = u'учебный год'
        verbose_name_plural = u'учебные года'

    def __unicode__(self):
        return u'%s %s' % (self.date_begin, self.date_end )

class Groups(models.Model):
    id_spec = models.ForeignKey(Speciality, verbose_name=u"Специальность") # 230105.*
    name = models.IntegerField(u'Группа', max_length=100) # 808

    class Meta:
        verbose_name = u'группа'
        verbose_name_plural = u'группы'

    def __unicode__(self):
        return u'%s' % (self.name, )

class Groups_stud(models.Model):
    id_group = models.ForeignKey(Groups, verbose_name=u'Группа')
    id_student = models.CharField(u"Студент", max_length=100, null=True, blank=True, choices=students)

    class Meta:
        verbose_name = u'студент группы'
        verbose_name_plural = u'студенты группы'

class Groups_plan(models.Model):
    """
    план группы на определенный учебный год
    """
    id_year = models.ForeignKey(Year, verbose_name=u'Год')
    id_group = models.ForeignKey(Groups, verbose_name=u'Группа')

    class Meta:
        verbose_name = u'план группы'
        verbose_name_plural = u'планы группы'

    def __unicode__(self):
        return u'%s - %s' % (self.id_year.date_begin, self.id_group.name)


class tariffication(models.Model):
    id_teacher = models.IntegerField(u"Учитель", max_length=100)
    id_group = models.ForeignKey(Groups_plan, verbose_name=u"Группа")
    id_uch_plan_hour = models.IntegerField(u"Час учебного плана", max_length=100)

    class Meta:
        verbose_name = u'тарификация'
        verbose_name_plural = u'тарификации'

#class Absences(models.Model):
#class Schedule(models.Model):
#class Schedule_day(models.Model):
#class Classroom(models.Model):
#class Mark(models.Model):
#class Column(models.Model):
#class Type_column(models.Model):
#


