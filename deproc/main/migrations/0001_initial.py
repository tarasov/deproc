# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):
    
    def forwards(self, orm):
        
        # Adding model 'Profile'
        db.create_table('main_profile', (
            ('b_day', self.gf('django.db.models.fields.DateField')(null=True, blank=True)),
            ('phone', self.gf('django.db.models.fields.CharField')(max_length=100, null=True, blank=True)),
            ('user_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['auth.User'], unique=True, primary_key=True)),
            ('other_name', self.gf('django.db.models.fields.CharField')(max_length=100, null=True, blank=True)),
            ('sex', self.gf('django.db.models.fields.CharField')(max_length=100, null=True, blank=True)),
        ))
        db.send_create_signal('main', ['Profile'])

        # Adding model 'UserStatus'
        db.create_table('main_userstatus', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=100)),
        ))
        db.send_create_signal('main', ['UserStatus'])

        # Adding model 'Group'
        db.create_table('main_group', (
            ('group_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['auth.Group'], unique=True, primary_key=True)),
            ('describe', self.gf('django.db.models.fields.CharField')(max_length=150)),
        ))
        db.send_create_signal('main', ['Group'])

        # Adding M2M table for field status on 'Group'
        db.create_table('main_group_status', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('group', models.ForeignKey(orm['main.group'], null=False)),
            ('userstatus', models.ForeignKey(orm['main.userstatus'], null=False))
        ))
        db.create_unique('main_group_status', ['group_id', 'userstatus_id'])

        # Adding model 'UserPost'
        db.create_table('main_userpost', (
            ('date_end', self.gf('django.db.models.fields.DateField')(null=True, blank=True)),
            ('date_begin', self.gf('django.db.models.fields.DateField')()),
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('user', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['auth.User'])),
        ))
        db.send_create_signal('main', ['UserPost'])

        # Adding M2M table for field status on 'UserPost'
        db.create_table('main_userpost_status', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('userpost', models.ForeignKey(orm['main.userpost'], null=False)),
            ('userstatus', models.ForeignKey(orm['main.userstatus'], null=False))
        ))
        db.create_unique('main_userpost_status', ['userpost_id', 'userstatus_id'])

        # Adding model 'PO'
        db.create_table('main_po', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=150)),
        ))
        db.send_create_signal('main', ['PO'])

        # Adding model 'Speciality'
        db.create_table('main_speciality', (
            ('num_spec', self.gf('django.db.models.fields.FloatField')(max_length=100)),
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=150)),
        ))
        db.send_create_signal('main', ['Speciality'])

        # Adding model 'Disc_type'
        db.create_table('main_disc_type', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=150)),
        ))
        db.send_create_signal('main', ['Disc_type'])

        # Adding model 'Discipline'
        db.create_table('main_discipline', (
            ('type', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['main.Disc_type'])),
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('short_name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=150)),
        ))
        db.send_create_signal('main', ['Discipline'])

        # Adding model 'UchPlan'
        db.create_table('main_uchplan', (
            ('semestr', self.gf('django.db.models.fields.IntegerField')(max_length=100)),
            ('disc', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['main.Discipline'])),
            ('otch', self.gf('django.db.models.fields.CharField')(max_length=100, null=True, blank=True)),
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('spec', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['main.Speciality'])),
        ))
        db.send_create_signal('main', ['UchPlan'])

        # Adding model 'UchPlanHour'
        db.create_table('main_uchplanhour', (
            ('uch_plan', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['main.UchPlan'], max_length=100)),
            ('type', self.gf('django.db.models.fields.CharField')(max_length=100, null=True, blank=True)),
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('count_hours', self.gf('django.db.models.fields.IntegerField')(max_length=100)),
        ))
        db.send_create_signal('main', ['UchPlanHour'])

        # Adding model 'Year'
        db.create_table('main_year', (
            ('date_end', self.gf('django.db.models.fields.DateField')()),
            ('date_begin', self.gf('django.db.models.fields.DateField')()),
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
        ))
        db.send_create_signal('main', ['Year'])

        # Adding model 'Groups'
        db.create_table('main_groups', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.IntegerField')(max_length=100)),
            ('spec', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['main.Speciality'])),
        ))
        db.send_create_signal('main', ['Groups'])

        # Adding model 'Groups_stud'
        db.create_table('main_groups_stud', (
            ('group', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['main.Groups'])),
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('student', self.gf('django.db.models.fields.CharField')(max_length=100, null=True, blank=True)),
        ))
        db.send_create_signal('main', ['Groups_stud'])

        # Adding model 'Groups_plan'
        db.create_table('main_groups_plan', (
            ('group', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['main.Groups'])),
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('year', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['main.Year'])),
        ))
        db.send_create_signal('main', ['Groups_plan'])

        # Adding model 'Tariffication'
        db.create_table('main_tariffication', (
            ('uch_plan_hour', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['main.UchPlanHour'])),
            ('group_plan', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['main.Groups_plan'])),
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('teacher', self.gf('django.db.models.fields.IntegerField')(max_length=100)),
        ))
        db.send_create_signal('main', ['Tariffication'])

        # Adding model 'Classroom'
        db.create_table('main_classroom', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('number', self.gf('django.db.models.fields.IntegerField')(max_length=100)),
        ))
        db.send_create_signal('main', ['Classroom'])

        # Adding model 'Schedule_day'
        db.create_table('main_schedule_day', (
            ('real', self.gf('django.db.models.fields.BooleanField')(default=False, blank=True)),
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('day', self.gf('django.db.models.fields.DateField')(max_length=100, null=True, blank=True)),
        ))
        db.send_create_signal('main', ['Schedule_day'])

        # Adding model 'Schedule'
        db.create_table('main_schedule', (
            ('classroom', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['main.Classroom'])),
            ('num_less', self.gf('django.db.models.fields.IntegerField')()),
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('day', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['main.Schedule_day'])),
            ('plan', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['main.Tariffication'])),
        ))
        db.send_create_signal('main', ['Schedule'])

        # Adding model 'Absences'
        db.create_table('main_absences', (
            ('absence', self.gf('django.db.models.fields.CharField')(max_length=10, null=True, blank=True)),
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('student', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['main.Profile'])),
            ('schedule', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['main.Schedule'])),
        ))
        db.send_create_signal('main', ['Absences'])
    
    
    def backwards(self, orm):
        
        # Deleting model 'Profile'
        db.delete_table('main_profile')

        # Deleting model 'UserStatus'
        db.delete_table('main_userstatus')

        # Deleting model 'Group'
        db.delete_table('main_group')

        # Removing M2M table for field status on 'Group'
        db.delete_table('main_group_status')

        # Deleting model 'UserPost'
        db.delete_table('main_userpost')

        # Removing M2M table for field status on 'UserPost'
        db.delete_table('main_userpost_status')

        # Deleting model 'PO'
        db.delete_table('main_po')

        # Deleting model 'Speciality'
        db.delete_table('main_speciality')

        # Deleting model 'Disc_type'
        db.delete_table('main_disc_type')

        # Deleting model 'Discipline'
        db.delete_table('main_discipline')

        # Deleting model 'UchPlan'
        db.delete_table('main_uchplan')

        # Deleting model 'UchPlanHour'
        db.delete_table('main_uchplanhour')

        # Deleting model 'Year'
        db.delete_table('main_year')

        # Deleting model 'Groups'
        db.delete_table('main_groups')

        # Deleting model 'Groups_stud'
        db.delete_table('main_groups_stud')

        # Deleting model 'Groups_plan'
        db.delete_table('main_groups_plan')

        # Deleting model 'Tariffication'
        db.delete_table('main_tariffication')

        # Deleting model 'Classroom'
        db.delete_table('main_classroom')

        # Deleting model 'Schedule_day'
        db.delete_table('main_schedule_day')

        # Deleting model 'Schedule'
        db.delete_table('main_schedule')

        # Deleting model 'Absences'
        db.delete_table('main_absences')
    
    
    models = {
        'auth.group': {
            'Meta': {'object_name': 'Group'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '80'}),
            'permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'})
        },
        'auth.permission': {
            'Meta': {'unique_together': "(('content_type', 'codename'),)", 'object_name': 'Permission'},
            'codename': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['contenttypes.ContentType']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        'auth.user': {
            'Meta': {'object_name': 'User'},
            'date_joined': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 4, 2, 7, 56, 28, 634075, tzinfo=<UTC>)'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'groups': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Group']", 'symmetrical': 'False', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'True', 'blank': 'True'}),
            'is_staff': ('django.db.models.fields.BooleanField', [], {'default': 'False', 'blank': 'True'}),
            'is_superuser': ('django.db.models.fields.BooleanField', [], {'default': 'False', 'blank': 'True'}),
            'last_login': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 4, 2, 7, 56, 28, 633911, tzinfo=<UTC>)'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'user_permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'}),
            'username': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'})
        },
        'contenttypes.contenttype': {
            'Meta': {'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'main.absences': {
            'Meta': {'object_name': 'Absences'},
            'absence': ('django.db.models.fields.CharField', [], {'max_length': '10', 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'schedule': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.Schedule']"}),
            'student': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.Profile']"})
        },
        'main.classroom': {
            'Meta': {'object_name': 'Classroom'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'number': ('django.db.models.fields.IntegerField', [], {'max_length': '100'})
        },
        'main.disc_type': {
            'Meta': {'object_name': 'Disc_type'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '150'})
        },
        'main.discipline': {
            'Meta': {'object_name': 'Discipline'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '150'}),
            'short_name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.Disc_type']"})
        },
        'main.group': {
            'Meta': {'object_name': 'Group', '_ormbases': ['auth.Group']},
            'describe': ('django.db.models.fields.CharField', [], {'max_length': '150'}),
            'group_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['auth.Group']", 'unique': 'True', 'primary_key': 'True'}),
            'status': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'to': "orm['main.UserStatus']", 'null': 'True', 'blank': 'True'})
        },
        'main.groups': {
            'Meta': {'object_name': 'Groups'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.IntegerField', [], {'max_length': '100'}),
            'spec': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.Speciality']"})
        },
        'main.groups_plan': {
            'Meta': {'object_name': 'Groups_plan'},
            'group': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.Groups']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'year': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.Year']"})
        },
        'main.groups_stud': {
            'Meta': {'object_name': 'Groups_stud'},
            'group': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.Groups']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'student': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'})
        },
        'main.po': {
            'Meta': {'object_name': 'PO'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '150'})
        },
        'main.profile': {
            'Meta': {'object_name': 'Profile', '_ormbases': ['auth.User']},
            'b_day': ('django.db.models.fields.DateField', [], {'null': 'True', 'blank': 'True'}),
            'other_name': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'phone': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'sex': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'user_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['auth.User']", 'unique': 'True', 'primary_key': 'True'})
        },
        'main.schedule': {
            'Meta': {'object_name': 'Schedule'},
            'classroom': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.Classroom']"}),
            'day': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.Schedule_day']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'num_less': ('django.db.models.fields.IntegerField', [], {}),
            'plan': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.Tariffication']"})
        },
        'main.schedule_day': {
            'Meta': {'object_name': 'Schedule_day'},
            'day': ('django.db.models.fields.DateField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'real': ('django.db.models.fields.BooleanField', [], {'default': 'False', 'blank': 'True'})
        },
        'main.speciality': {
            'Meta': {'object_name': 'Speciality'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '150'}),
            'num_spec': ('django.db.models.fields.FloatField', [], {'max_length': '100'})
        },
        'main.tariffication': {
            'Meta': {'object_name': 'Tariffication'},
            'group_plan': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.Groups_plan']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'teacher': ('django.db.models.fields.IntegerField', [], {'max_length': '100'}),
            'uch_plan_hour': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.UchPlanHour']"})
        },
        'main.uchplan': {
            'Meta': {'object_name': 'UchPlan'},
            'disc': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.Discipline']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'otch': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'semestr': ('django.db.models.fields.IntegerField', [], {'max_length': '100'}),
            'spec': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.Speciality']"})
        },
        'main.uchplanhour': {
            'Meta': {'object_name': 'UchPlanHour'},
            'count_hours': ('django.db.models.fields.IntegerField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'type': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'uch_plan': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['main.UchPlan']", 'max_length': '100'})
        },
        'main.userpost': {
            'Meta': {'object_name': 'UserPost'},
            'date_begin': ('django.db.models.fields.DateField', [], {}),
            'date_end': ('django.db.models.fields.DateField', [], {'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'status': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['main.UserStatus']", 'symmetrical': 'False'}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['auth.User']"})
        },
        'main.userstatus': {
            'Meta': {'object_name': 'UserStatus'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'main.year': {
            'Meta': {'object_name': 'Year'},
            'date_begin': ('django.db.models.fields.DateField', [], {}),
            'date_end': ('django.db.models.fields.DateField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        }
    }
    
    complete_apps = ['main']
