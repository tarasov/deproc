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
    ('L', 'Лекция',),
    ('P', 'Практика',),
    ('S', 'Консультация',),
    ('E', 'Экзамен',),
)

# TODO сделать генератор
choice_semesters = (
    ('1, 2', '1, 2',),
    ('3, 4', '3, 4',),
    ('5, 6', '5, 6',),
    ('7, 8', '7, 8',),
    ('9, 10', '9, 10',),
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
        return [(teacher.pk, '%s %s %s' % (teacher.last_name, teacher.first_name, teacher.other_name, )) for teacher in teachers]

    def __unicode__(self):
        return u'%s %s %s' % (self.last_name, self.first_name, self.other_name)

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
    num_spec = models.FloatField(u"Номер специальности",  max_length=100)

    def get_absolute_url(self):
        return 'speciality/%s' % str(self.id)

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

    def get_absolute_url(self):
        return 'discipline/%s' % str(self.id)

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
        return u'%s / %s / %s семестр' % (self.disc, self.spec.name, self.semestr)

    class Meta:
        verbose_name = u'учебный план'
        verbose_name_plural = u'учебные планы'

class UchPlanHour(models.Model):
    """
    Учебный план часа, тут указаны типы часов и их количество у определенного учебного плана
    """
    uch_plan = models.ForeignKey(UchPlan, verbose_name="Учебный план", max_length=100)
    # TODO rename to typeh
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
    name = models.IntegerField(u'Группа', max_length=100, unique=True) # 808
    # проверить choice_semesters[0]
    semestr = models.CharField(u'семестры', max_length=6, choices=choice_semesters, default=choice_semesters[0])

    def get_absolute_url(self):
        return 'groups/%s' % str(self.id)

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
    course = models.IntegerField(u"Курс", default=1)

    class Meta:
        verbose_name = u'план группы'
        verbose_name_plural = u'планы группы'

    def __unicode__(self):
        return u'%s / %s курc' % (self.group.name, self.course, )


class Tariffication(models.Model):
    teacher = models.IntegerField(u"Преподаватель", max_length=100)
    group_plan = models.ForeignKey(Groups_plan, verbose_name=u"План группы")
    uch_plan_hour = models.ForeignKey(UchPlanHour, verbose_name=u"Час учебного плана")

    def get_teacher(self):
        return Profile.objects.get(pk=self.teacher)

    def get_absolute_url(self):
        return 'tariffication/%s' % str(self.id),

    set_teacher = property(get_teacher)

    class Meta:
        verbose_name = u'тарификация'
        verbose_name_plural = u'тарификации'

    def __unicode__(self):
        return u'%s %s %s' % (Profile.objects.get(pk=self.teacher), self.group_plan, self.uch_plan_hour)


#class Mark(models.Model):
#class Column(models.Model):
#class Type_column(models.Model):



