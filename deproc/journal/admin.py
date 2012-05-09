from django.contrib.admin import site
from models import Assessment, Journal_day, Types_themes

site.register(Assessment)
site.register(Journal_day)
site.register(Types_themes)