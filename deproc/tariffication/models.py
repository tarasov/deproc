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

    class Meta:
        verbose_name = u'пользователь'
        verbose_name_plural = u'пользователи'
        db_table = 'profile'

    def __unicode__(self):
        return u'%s %s %s' % (self.last_name, self.first_name, self.other_name)


class Students(Profile):
    cart = models.IntegerField("Номер студенческого")

    class Meta:
        verbose_name = u'студента'
        verbose_name_plural = u'студенты'
        db_table = 'students'

    def get_students(self):
        students = Students.objects.all()
        return ((student.pk, student.username) for student in students)

    def __unicode__(self):
        return u'%s %s %s' % (self.last_name, self.first_name, self.other_name)


class Teachers(Profile):
    cabinet = models.IntegerField("Кабинет")

    class Meta:
        verbose_name = u'преподователя'
        verbose_name_plural = u'преподователи'
        db_table = 'teachers'

    def get_teachers(self):
        teachers = Teachers.objects.all()
        return ((teacher.pk, '%s %s %s' % (teacher.last_name, teacher.first_name, teacher.other_name, )) for teacher in teachers)

    def __unicode__(self):
        return u'%s %s %s' % (self.last_name, self.first_name, self.other_name)


class UserStatus(models.Model):
    name = models.CharField(u"Статус", max_length=100, null=False, blank=False )

    class Meta:
        verbose_name = u'статус'
        verbose_name_plural = u'статусы'
        db_table = 'user_status'

    def __unicode__(self):
        return u'%s' % (self.name,)


class Group(Group):
    describe = models.CharField(u"Описание", max_length=150 )
    status = models.ManyToManyField(UserStatus, blank=True, null=True, verbose_name="Статусы")

    class Meta:
        verbose_name = u'группа'
        verbose_name_plural = u'группы'
        db_table = 'group'

    def __unicode__(self):
        return u'%s' % (self.name, )


class UserPost(models.Model):
    user = models.ForeignKey(User, verbose_name="Пользователь")
    status = models.ManyToManyField(UserStatus, verbose_name="Статус")
    date_begin = models.DateField("Дата начала", null=False,blank=False)
    date_end = models.DateField("Дата", null=True, blank=True)

    class Meta:
        verbose_name = u'должность'
        verbose_name_plural = u'должности'
        db_table = 'user_post'

    def get_user_status(self):
        post = []
        for p in self.status.filter(): post.append(p.name)
        return ', '.join(post)

    def __unicode__(self):
        return u'%s' % self.user


class PO(models.Model):
    name = models.CharField(u"Профессиональное образование", max_length=150, null=False, blank=False)

    class Meta:
        verbose_name = u'профессиональное образование'
        verbose_name_plural = u'профессиональное образование'
        db_table = 'po'

    def __unicode__(self):
        return u'%s' % (self.name, )


class Speciality(models.Model):
    name = models.CharField(u"Специальность", max_length=150, null=False, blank=False)
    num_spec = models.FloatField(u"Номер специальности",  max_length=100)

    class Meta:
        verbose_name = u'специальность'
        verbose_name_plural = u'специальности'
        db_table = 'speciality'

    def get_absolute_url(self):
        return 'speciality/%s' % str(self.id)

    def __unicode__(self):
        return u'%s %s' % (self.name, self.num_spec)


class Disc_type(models.Model):
    name = models.CharField(u"Тип дисциплины", max_length=150, null=False, blank=False)

    class Meta:
        verbose_name = u'тип дисциплины'
        verbose_name_plural = u'типы дисциплины'
        db_table = 'disc_type'

    def __unicode__(self):
        return u'%s' % (self.name, )


class Discipline(models.Model):
    name = models.CharField(u"Дисциплина", max_length=150, null=False, blank=False) # Программное обеспечени компьютерных сетей
    short_name = models.CharField(u"Короткое название", max_length=100, null=False, blank=False) # ПОКС
    type = models.ForeignKey(Disc_type, verbose_name=u"Тип дисциплины") # лекция, практика, консультация

    class Meta:
        verbose_name = u'дисциплина'
        verbose_name_plural = u'дисциплины'
        db_table = 'discipline'

    def get_absolute_url(self):
        return 'discipline/%s' % str(self.id)

    def __unicode__(self):
        return u'%s' % (self.short_name, )


class UchPlan(models.Model):
    disc = models.ForeignKey(Discipline, verbose_name=u"Дисциплина")
    spec = models.ForeignKey(Speciality, verbose_name=u"Специальность")
    semestr = models.IntegerField(u"Семестр", max_length=100)
    otch = models.CharField(u"Отчетность", max_length=100, null=True, blank=True, choices=choice_otch)

    class Meta:
        verbose_name = u'учебный план'
        verbose_name_plural = u'учебные планы'
        db_table = 'uch_plan'

    def __unicode__(self):
        return u'%s / %s / %s семестр' % (self.disc, self.spec.name, self.semestr)


class UchPlanHour(models.Model):
    """
    Учебный план часа, тут указаны типы часов и их количество у определенного учебного плана
    """
    uch_plan = models.ForeignKey(UchPlan, verbose_name="Учебный план", max_length=100)
    # TODO rename to typeh
    type = models.CharField(u"Тип часа", max_length=100, null=True, blank=True, choices=choice_typeh) # лекция, практика, консультация
    count_hours = models.IntegerField(u"Количество часов", max_length=100)

    class Meta:
        verbose_name = u'час учебного плана'
        verbose_name_plural = u'часы учебного плана'
        db_table = 'uch_plan_hour'

    def __unicode__(self):
        return u'%s / %s / %s часов' % (self.uch_plan, self.type, self.count_hours)


class Year(models.Model):
    date_begin = models.DateField(u"Начало учебного года", null=False, blank=False) # 1.08.11
    date_end = models.DateField(u"Конец учебного года", null=False, blank=False) # 30.06.12

    class Meta:
        verbose_name = u'учебный год'
        verbose_name_plural = u'учебные года'
        db_table = 'year'

    def __unicode__(self):
        return u'%s %s' % (self.date_begin, self.date_end )


class Groups(models.Model):
    spec = models.ForeignKey(Speciality, verbose_name=u"Специальность") # 230105.*
    name = models.IntegerField(u'Группа', max_length=100, unique=True) # 808
    # проверить choice_semesters[0]
    semestr = models.CharField(u'семестры', max_length=6, choices=choice_semesters, default=choice_semesters[0])

    class Meta:
        verbose_name = u'группу студентов'
        verbose_name_plural = u'группы студентов'
        db_table = 'groups'

    def get_absolute_url(self):
        return 'groups/%s' % str(self.id)

    def get_journal_url(self):
        return '../group/%s' % str(self.id)

    def __unicode__(self):
        return u'%s' % (self.name, )


class Groups_stud(models.Model):
    group = models.ForeignKey(Groups, verbose_name=u'Группа')
    student = models.ForeignKey(Students, verbose_name='Студент')

    class Meta:
        verbose_name = u'студент группы'
        verbose_name_plural = u'студенты группы'
        db_table = 'groups_stud'

    def __unicode__(self):
        return u'%s' % (self.group.name, )


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
        db_table = 'groups_plan'

    def __unicode__(self):
        return u'%s / %s курc' % (self.group.name, self.course, )


class Tariffication(models.Model):
    teacher = models.ForeignKey(Teachers, verbose_name='Преподаватель')
    group_plan = models.ForeignKey(Groups_plan, verbose_name=u"План группы")
    uch_plan_hour = models.ForeignKey(UchPlanHour, verbose_name=u"Час учебного плана")

    class Meta:
        verbose_name = u'тарификация'
        verbose_name_plural = u'тарификации'
        db_table = 'tariffication'

    def get_absolute_url(self):
        return 'tariffication/%s' % str(self.pk),

    def __unicode__(self):
        return u'%s %s %s' % (Profile.objects.get(pk=self.teacher), self.group_plan, self.uch_plan_hour)