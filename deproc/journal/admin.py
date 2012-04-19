from django.contrib.admin import site
from models import Assessment, Themes

site.register(Assessment)
site.register(Themes)