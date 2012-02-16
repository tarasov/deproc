from django.forms import ModelForm
from django import forms
from deproc.main import models

class UserForm(ModelForm):
    def as_table(self):
        return self._html_output(
            normal_row = u'<tr%(html_class_attr)s><td>%(label)s</td><td>%(errors)s%(field)s%(help_text)s</td></tr>',
            error_row = u'<tr><td colspan="2">%s</td></tr>',
            row_ender = u'</td></tr>',
            help_text_html = u'<br /><span class="helptext">%s</span>',
            errors_on_separate_row = False)

    class Meta:
        model = models.User

class SpecialityForm(ModelForm):
    class Meta:
        model = models.Speciality

class POForm(ModelForm):
    class Meta:
        model = models.PO

class GroupsForm(ModelForm):
    class Meta:
        model = models.Groups

class UserForm(ModelForm):
    class Meta:
        model = models.User

class UserStatusForm(ModelForm):
    class Meta:
        model = models.UserStatus

class GroupForm(ModelForm):
    class Meta:
        model = models.Group

class UserPostForm(ModelForm):
    class Meta:
        model = models.UserPost

class SpecialitypForm(ModelForm):
    class Meta:
        model = models.Speciality

class Disc_typeForm(ModelForm):
    class Meta:
        model = models.Disc_type

