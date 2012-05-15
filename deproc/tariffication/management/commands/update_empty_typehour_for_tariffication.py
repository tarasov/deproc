__author__ = 'tarasov'
# -*- coding: utf-8 -*-
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

        logging.info('tariffications: {0}'.format(tariffications.count()))

        for tariffication in tariffications:
            try:
                logging.info('START {0}'.format(tariffication))
                transaction.commit()
                logging.info('END {0}'.format(tariffication))

            except Exception as e:
                logging.info('ERROR {0}; {1}'.format(tariffication, str(e)))
                transaction.rollback()
