# -*- coding: utf-8 -*-
from deproc.tariffication.models import Tariffication
from django.core.management.base import BaseCommand
from django.db import transaction, connection
from django.db.models import Q
from deproc.tariffication import models
import logging

logging.basicConfig(level=logging.INFO, format="%(asctime)s - %(name)s - %(levelname)s - %(message)s")

class Command(BaseCommand):

    @transaction.commit_manually
    def handle(self, *args, **kwargs):

        tariffications = models.Tariffication.objects.all().select_related('uch_plan_hour', 'uch_plan_hour__uch_plan')
        teachers = models.Teachers.objects.all()
        logging.info('tariffications: {0}'.format(tariffications.count()))
        typehours = models.TypeHour.objects.all()


        for teacher in teachers:
            for group in teacher.get_groups():
                for discipline in group.get_disciplines(teacher):
                    try:
                        for typehour in typehours:
                            obj, is_created = Tariffication.objects.get_or_create(
                                teacher = teacher,
                                group_plan__group = group,
                                uch_plan_hour__uch_plan__disc = discipline,
                                uch_plan_hour__type_hour__name = typehour,
                                defaults = {'type_hour': 0}
                            )
                        if is_created:
                            transaction.commit()
                        else:
                            transaction.rollback()
                    except Exception as e:
                        logging.error('ERROR {0}; {1}'.format('ERROR!!!', str(e)))
                        transaction.rollback()