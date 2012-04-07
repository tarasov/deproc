# -*- coding: utf-8 -*-
from django.contrib.auth.models import User, Group
from django.db import models


choise_sex = (
    ('M', 'мужик',),
    ('B', 'женщина',)
)

choice_otch = (
    ('E', 'экзамен',),
    ('Z', 'зачет',)
)

choice_typeh = (
    ('L', 'лекция',),
    ('P', 'практика',),
    ('S', 'консультация',),
    ('E', 'экзамен',),
)

class Profile(User):
    other_name = models.CharField(u"Отчество", max_length=100, null=True, blank=True )
    b_day = models.DateField(u"День рождения", null=True, blank=True)
    phone = models.CharField(u"Телефон", max_length=100, null=True, blank=True )
    sex = models.CharField(u"Пол", max_length=100, null=True, blank=True, choices=choise_sex)

    def get_students(self):
        # Студенты
        students = Profile.objects.filter(groups__name="Студенты")
        return [(student.pk, student.username) for student in students]

    def get_teachers(self):
        # Преподаватели
        teachers = Profile.objects.filter(groups__name="Преподаватели")
        return [(teacher.pk, teacher.username) for teacher in teachers]


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
    status = models.ManyToManyField(UserStatus, blank=True, null=True, verbose_name="Статусы")

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

    def get_user_status(self):
        post = []
        for p in self.status.filter(): post.append(p.name)
        return post

    class Meta:
        verbose_name = u'должность'
        verbose_name_plural = u'должности'

    def __unicode__(self):
        return u'%s' % self.user

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
    type = models.ForeignKey(Disc_type, verbose_name=u"Тип дисциплины") # лекция, практика, консультация

    class Meta:
        verbose_name = u'дисциплина'
        verbose_name_plural = u'дисциплины'

    def __unicode__(self):
        return u'%s' % (self.short_name, )


class UchPlan(models.Model):
    disc = models.ForeignKey(Discipline, verbose_name=u"Дисциплина")
    spec = models.ForeignKey(Speciality, verbose_name=u"Специальность")
    semestr = models.IntegerField(u"Семестр", max_length=100)
    otch = models.CharField(u"Отчетность", max_length=100, null=True, blank=True, choices=choice_otch)

    def __unicode__(self):
        return u'%s / %s / %s семестр' % (self.disc, self.spec, self.semestr)

    class Meta:
        verbose_name = u'учебный план'
        verbose_name_plural = u'учебные планы'

class UchPlanHour(models.Model):
    uch_plan = models.ForeignKey(UchPlan, verbose_name="Учебный план", max_length=100) # учебный план
    type = models.CharField(u"Тип часа", max_length=100, null=True, blank=True, choices=choice_typeh) # лекция, практика, консультация
    count_hours = models.IntegerField(u"Количество часов", max_length=100)

    def __unicode__(self):
        return u'%s / %s / %s часов' % (self.uch_plan, self.type, self.count_hours)

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
    spec = models.ForeignKey(Speciality, verbose_name=u"Специальность") # 230105.*
    name = models.IntegerField(u'Группа', max_length=100) # 808
    semestr = models.IntegerField(u'семестр', default=1)

    class Meta:
        verbose_name = u'группу студентов'
        verbose_name_plural = u'группа студентов'

    def __unicode__(self):
        return u'%s' % (self.name, )

class Groups_stud(models.Model):
    group = models.ForeignKey(Groups, verbose_name=u'Группа')
    student = models.CharField(u"Студент", max_length=100, null=True, blank=True, choices=Profile().get_students())

    class Meta:
        verbose_name = u'студент группы'
        verbose_name_plural = u'студенты группы'

class Groups_plan(models.Model):
    """
    план группы на определенный учебный год
    """
    year = models.ForeignKey(Year, verbose_name=u'Год')
    group = models.ForeignKey(Groups, verbose_name=u'Группа')
    class Meta:
        verbose_name = u'план группы'
        verbose_name_plural = u'планы группы'

    def __unicode__(self):
        return u'%s - %s' % (self.year.date_begin, self.group.name)

class Tariffication(models.Model):
    teacher = models.IntegerField(u"Учитель", max_length=100, choices=Profile().get_teachers())
    group_plan = models.ForeignKey(Groups_plan, verbose_name=u"План группы")
    uch_plan_hour = models.ForeignKey(UchPlanHour, verbose_name=u"Час учебного плана")



    def get_teacher(self):
        return Profile.objects.get(pk=self.teacher)

    set_teacher = property(get_teacher)

    class Meta:
        verbose_name = u'тарификация'
        verbose_name_plural = u'тарификации'

    def __unicode__(self):
        return u'%s %s %s' % (Profile.objects.get(pk=self.teacher), self.group_plan, self.uch_plan_hour)


#class Mark(models.Model):
#class Column(models.Model):
#class Type_column(models.Model):



