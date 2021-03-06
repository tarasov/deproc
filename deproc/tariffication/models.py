# -*- coding: utf-8 -*-
from django.contrib.auth.models import User, Group
from django.db import models, connection
from django.db.models.aggregates import Count
from django.shortcuts import get_object_or_404
from django.core.urlresolvers import reverse

class Classroom(models.Model):
    number = models.IntegerField(max_length=100, null=False, blank=False)

    class Meta:
        verbose_name = u'кабинет'
        verbose_name_plural = u'кабинеты'
        db_table = 'classroom'

    def __unicode__(self):
        return u'%s' % self.number


# TODO все кортежи раскидать по классам и потихоньку применять к проекту или создать модели (наилучший вариант)
# например пола всего 2, по этому можно кинуть в класс Profike

choise_sex = (
    ('M', 'мужчина',),
    ('W', 'женщина',)
)

choice_otch = (
    ('E', 'экзамен',),
    ('Z', 'зачет',)
)

#choice_typeh = (
#    ('L', 'Лекция',),
#    ('P', 'Практика',),
#    ('K', 'Консультация',),
#    ('E', 'Экзамен',),
#)


class Profile(User):
    other_name = models.CharField(u"Отчество", max_length=100, null=True, blank=True )
    b_day = models.DateField(u"День рождения", null=True, blank=True)
    phone = models.CharField(u"Телефон", max_length=100, null=True, blank=True )
    sex = models.CharField(u"Пол", max_length=100, null=True, blank=True, choices=choise_sex)

    class Meta:
        verbose_name = u'пользователь'
        verbose_name_plural = u'пользователи'
        ordering = ['last_name']
        db_table = 'profile'

    def get_absolute_url(self):
        return reverse('user', args = [self.id])


    def get_full_name(self):
        full_name = u'%s %s %s' % (self.last_name, self.first_name, self.other_name)
        return full_name.strip()

    def __unicode__(self):
        return u'%s %s %s' % (self.last_name, self.first_name, self.other_name)


class Students(Profile):
    cart = models.IntegerField("Номер студенческого")
    is_elder = models.BooleanField('Староста', default = False)

    class Meta:
        verbose_name = u'студента'
        verbose_name_plural = u'студенты'
        db_table = 'students'

    @property
    def group(self):
        if Groups_stud.objects.filter(student=self):
            return Groups_stud.objects.filter(student=self)[0].group
        else:
            return None

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
        return reverse('action_page', kwargs={'page': 'speciality', 'pk': self.id})

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
    name = models.CharField(u"Дисциплина", max_length=150, null=False, blank=False)
    short_name = models.CharField(u"Короткое название", max_length=100, null=False, blank=False)
    type = models.ForeignKey(Disc_type, verbose_name=u"Тип дисциплины")

    class Meta:
        verbose_name = u'дисциплину'
        verbose_name_plural = u'дисциплины'
        db_table = 'discipline'

    def get_absolute_url(self):
        return reverse('action_page', kwargs={'page': 'discipline', 'pk': self.id})

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

    def get_absolute_url(self):
        return reverse('action_page', kwargs={'page': 'uch_plan', 'pk': self.id})

    def __unicode__(self):
        return u'%s / %s / %s семестр' % (self.disc, self.spec.name, self.semestr)


class TypeHour(models.Model):
    name = models.CharField(u'название', max_length=40)
    short_name = models.CharField(u'сокращение', max_length=6)

    class Meta:
        verbose_name = u'тип часа'
        verbose_name_plural = u'типы часов'
        db_table = 'typehour'

    def get_absolute_url(self):
        return reverse('action_page', kwargs={'page': 'type_hour', 'pk': self.id})

    def __unicode__(self):
        return u'%s' % self.short_name


class UchPlanHour(models.Model):
    """
    Учебный план часа, тут указаны типы часов и их количество у определенного учебного плана
    """
    uch_plan = models.ForeignKey(UchPlan, verbose_name="Учебный план", max_length=100)
    type_hour = models.ForeignKey(TypeHour, verbose_name = u"Тип часа")
    count_hours = models.IntegerField(u"Количество часов", max_length=100)

    class Meta:
        verbose_name = u'час учебного плана'
        verbose_name_plural = u'часы учебного плана'
        db_table = 'uch_plan_hour'

    def __unicode__(self):
        return u'%s / %s / %s часов' % (self.uch_plan, self.type_hour, self.count_hours)


class Year(models.Model):
    date_begin = models.DateField(u"Начало учебного года", null=False, blank=False) # 1.08.11
    date_end = models.DateField(u"Конец учебного года", null=False, blank=False) # 30.06.12

    class Meta:
        verbose_name = u'учебный год'
        verbose_name_plural = u'учебные года'
        db_table = 'year'

    def get_absolute_url(self):
        return reverse('action_page', kwargs={'page': 'year', 'pk': self.id})

    def __unicode__(self):
        return u'%s - %s' % (self.date_begin, self.date_end )


class Groups(models.Model):

    choice_semesters = (
        ('1, 2', '1, 2',),
        ('3, 4', '3, 4',),
        ('5, 6', '5, 6',),
        ('7, 8', '7, 8',),
        ('9, 10', '9, 10',),
    )

    spec = models.ForeignKey(Speciality, verbose_name=u"Специальность") # 230105.*
    name = models.IntegerField(u'Группа', max_length=100, unique=True) # 808
    semestr = models.CharField(u'семестры', max_length=6, choices=choice_semesters, default=choice_semesters[0])

    class Meta:
        ordering = ['name']
        verbose_name = u'группу'
        verbose_name_plural = u'группы'
        db_table = 'groups'

    def get_absolute_url(self):
        return reverse('action_page', kwargs={'page': 'groups', 'pk': self.id})

    def get_journal_url(self):
        return '../group/%s' % str(self.id)

    def get_group_students_absolute_url(self):
        group_of_students = Groups_stud.objects.get(group=self)
        return group_of_students.get_absolute_url()

    def get_disciplines(self, teacher=None, discipline = None):
        if teacher:
            if discipline:
                return [discipline]
            disciplines = Tariffication.objects.filter(teacher = teacher, group_plan__group=self).values('uch_plan_hour__uch_plan__disc').annotate(count=Count('uch_plan_hour__uch_plan__disc__short_name'))
        else:
            disciplines = Tariffication.objects.filter(group_plan__group=self).values('uch_plan_hour__uch_plan__disc').annotate(count=Count('uch_plan_hour__uch_plan__disc__short_name'))

        return [get_object_or_404(Discipline, pk = int(discipline['uch_plan_hour__uch_plan__disc'])) for discipline in disciplines]

    def __unicode__(self):
        return u'%s' % (self.name, )

class Groups_stud(models.Model):
    group = models.ForeignKey(Groups, verbose_name=u'Группа')
    student = models.ManyToManyField(Students, verbose_name='Студент')

    class Meta:
        verbose_name = u'студент группы'
        verbose_name_plural = u'студенты группы'
        db_table = 'groups_stud'

    def get_absolute_url(self):
        return reverse('action_page', kwargs={'page': 'group_of_students', 'pk': self.id})


    def __unicode__(self):
        return u'%s' % (self.group.name, )

class Teachers(Profile):
    cabinet = models.ForeignKey(Classroom, verbose_name = "Кабинет", null = True, blank = True)
    manager = models.ForeignKey(Groups, verbose_name='Классный руководитель', null = True, blank = True)

    class Meta:
        verbose_name = u'преподователя'
        verbose_name_plural = u'преподователи'
        db_table = 'teachers'

    def get_teachers(self):
        teachers = Teachers.objects.all()
        return (
            (
                teacher.pk,
                '%s %s %s' % (teacher.last_name, teacher.first_name, teacher.other_name, )
                ) for teacher in teachers\
            )

    def get_tariffication(self):
        sql_teacher = """
        SELECT
            `auth_user`.`last_name`,
            `groups`.`name`,
            `discipline`.`short_name`,
            `uch_plan`.`semestr`,
            `uch_plan_hour`.`count_hours`,
            `uch_plan_hour`.`type`
        FROM `tariffication`
            LEFT JOIN `auth_user`
                ON `tariffication`.`teacher_id` = `auth_user`.`id`
            LEFT JOIN `groups_plan`
                ON `tariffication`.`group_plan_id` = `groups_plan`.`id`
            LEFT JOIN `groups`
                ON `groups_plan`.`group_id` = `groups`.`id`
            LEFT JOIN `uch_plan_hour`
                ON `tariffication`.`uch_plan_hour_id` = `uch_plan_hour`.`id`
            LEFT JOIN `uch_plan`
                ON `uch_plan_hour`.`uch_plan_id` = `uch_plan`.`id`
            Left JOIN `discipline`
                ON `uch_plan`.`disc_id` = `discipline`.`id`
        WHERE
            `auth_user`.`id` = '{0}'
        """
        cursor = connection.cursor()
        cursor.execute(sql_teacher.format(self.pk))
        return cursor.fetchall()

    def get_groups(self, group = None):
        """
        Группы в которых преподает преподователь
        """
        # если передали группу, возвращаем ее
        if group:
            return [group]

        groups = Tariffication.objects.filter(teacher = self).values('group_plan__group').annotate(count=Count('group_plan__group'))
        return Groups.objects.filter(id__in = [int(group['group_plan__group']) for group in groups])

    def get_disciplines_current_group(self, id_group):
        """
        Дисциплины в которых преподает преподователь, выбранной группы
        """
        group = get_object_or_404(Groups, pk=id_group)

        disciplines = Tariffication.objects.\
        filter(teacher = self, group_plan__group=group).\
        values('uch_plan_hour__uch_plan__disc').\
        annotate(count=Count('uch_plan_hour__uch_plan__disc__short_name'))

        return [Discipline.objects.get(pk = discipline['uch_plan_hour__uch_plan__disc']) for discipline in disciplines]

    def __unicode__(self):
        return u'%s %s %s' % (self.last_name, self.first_name, self.other_name)

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
    group_plan = models.ForeignKey(Groups_plan, verbose_name=u"План группы", related_name="gpset")
    uch_plan_hour = models.ForeignKey(UchPlanHour, verbose_name=u"Час учебного плана")

    class Meta:
        verbose_name = u'тарификация'
        verbose_name_plural = u'тарификации'
        db_table = 'tariffication'

    @property
    def semestr(self):
        return self.uch_plan_hour.uch_plan.semestr

    @property
    def count_hours(self):
        return self.uch_plan_hour.count_hours

    @property
    def disc(self):
        return self.uch_plan_hour.uch_plan.disc

    @property
    def type_hours(self):
        return self.uch_plan_hour.type_hour

    def get_tariffication(self, teacher = None, group = None, discipline = None):
        if not teacher:
            teachers = Teachers.objects.all()
        else:
            teachers = [teacher]

        table = []
        for teacher in teachers:
            # выбираем группы в которых преподает преподователь
            for group in teacher.get_groups(group):
                # выбираем дисциплины, которые которые относятся к группе и преподователю
                for discipline in group.get_disciplines(teacher, discipline):
                    tr = {}

                    tariffications = Tariffication.objects.filter(
                        teacher = teacher,
                        group_plan__group = group,
                        uch_plan_hour__uch_plan__disc = discipline
                    ).select_related('group_plan__group', 'uch_plan_hour__uch_plan__disc')
                    if teacher and group and discipline:
                        return tariffications
                    for i, tariffication in enumerate(tariffications):
                        if not i:
                            tr = {
                                'teacher': teacher,
                                'group': group,
                                'discipline': discipline,
                                'semestr': tariffication.semestr,
                                'hours': [tariffication.count_hours],
                            }
                        else:
                            tr['hours'].append(tariffication.count_hours)
                    table.append(tr)
        return table


    def __unicode__(self):
        return u'%s %s %s' % (Profile.objects.get(pk=self.teacher), self.group_plan, self.uch_plan_hour)


