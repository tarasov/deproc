from django.contrib.admin import site
from models import Assessment, Themes, Types_themes

site.register(Assessment)
site.register(Themes)
site.register(Types_themes)