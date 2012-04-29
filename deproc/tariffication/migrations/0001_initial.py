# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding model 'Profile'
        db.create_table('profile', (
            ('user_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['auth.User'], unique=True, primary_key=True)),
            ('other_name', self.gf('django.db.models.fields.CharField')(max_length=100, null=True, blank=True)),
            ('b_day', self.gf('django.db.models.fields.DateField')(null=True, blank=True)),
            ('phone', self.gf('django.db.models.fields.CharField')(max_length=100, null=True, blank=True)),
            ('sex', self.gf('django.db.models.fields.CharField')(max_length=100, null=True, blank=True)),
        ))
        db.send_create_signal('tariffication', ['Profile'])

        # Adding model 'Students'
        db.create_table('students', (
            ('profile_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['tariffication.Profile'], unique=True, primary_key=True)),
            ('cart', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal('tariffication', ['Students'])

        # Adding model 'Teachers'
        db.create_table('teachers', (
            ('profile_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['tariffication.Profile'], unique=True, primary_key=True)),
            ('cabinet', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal('tariffication', ['Teachers'])

        # Adding model 'UserStatus'
        db.create_table('user_status', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=100)),
        ))
        db.send_create_signal('tariffication', ['UserStatus'])

        # Adding model 'Group'
        db.create_table('group', (
            ('group_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['auth.Group'], unique=True, primary_key=True)),
            ('describe', self.gf('django.db.models.fields.CharField')(max_length=150)),
        ))
        db.send_create_signal('tariffication', ['Group'])

        # Adding M2M table for field status on 'Group'
        db.create_table('group_status', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('group', models.ForeignKey(orm['tariffication.group'], null=False)),
            ('userstatus', models.ForeignKey(orm['tariffication.userstatus'], null=False))
        ))
        db.create_unique('group_status', ['group_id', 'userstatus_id'])

        # Adding model 'UserPost'
        db.create_table('user_post', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('user', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['auth.User'])),
            ('date_begin', self.gf('django.db.models.fields.DateField')()),
            ('date_end', self.gf('django.db.models.fields.DateField')(null=True, blank=True)),
        ))
        db.send_create_signal('tariffication', ['UserPost'])

        # Adding M2M table for field status on 'UserPost'
        db.create_table('user_post_status', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('userpost', models.ForeignKey(orm['tariffication.userpost'], null=False)),
            ('userstatus', models.ForeignKey(orm['tariffication.userstatus'], null=False))
        ))
        db.create_unique('user_post_status', ['userpost_id', 'userstatus_id'])

        # Adding model 'PO'
        db.create_table('po', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=150)),
        ))
        db.send_create_signal('tariffication', ['PO'])

        # Adding model 'Speciality'
        db.create_table('speciality', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=150)),
            ('num_spec', self.gf('django.db.models.fields.FloatField')(max_length=100)),
        ))
        db.send_create_signal('tariffication', ['Speciality'])

        # Adding model 'Disc_type'
        db.create_table('disc_type', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=150)),
        ))
        db.send_create_signal('tariffication', ['Disc_type'])

        # Adding model 'Discipline'
        db.create_table('discipline', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=150)),
            ('short_name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('type', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['tariffication.Disc_type'])),
        ))
        db.send_create_signal('tariffication', ['Discipline'])

        # Adding model 'UchPlan'
        db.create_table('uch_plan', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('disc', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['tariffication.Discipline'])),
            ('spec', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['tariffication.Speciality'])),
            ('semestr', self.gf('django.db.models.fields.IntegerField')(max_length=100)),
            ('otch', self.gf('django.db.models.fields.CharField')(max_length=100, null=True, blank=True)),
        ))
        db.send_create_signal('tariffication', ['UchPlan'])

        # Adding model 'UchPlanHour'
        db.create_table('uch_plan_hour', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('uch_plan', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['tariffication.UchPlan'], max_length=100)),
            ('type', self.gf('django.db.models.fields.CharField')(max_length=100, null=True, blank=True)),
            ('count_hours', self.gf('django.db.models.fields.IntegerField')(max_length=100)),
        ))
        db.send_create_signal('tariffication', ['UchPlanHour'])

        # Adding model 'Year'
        db.create_table('year', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('date_begin', self.gf('django.db.models.fields.DateField')()),
            ('date_end', self.gf('django.db.models.fields.DateField')()),
        ))
        db.send_create_signal('tariffication', ['Year'])

        # Adding model 'Groups'
        db.create_table('groups', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('spec', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['tariffication.Speciality'])),
            ('name', self.gf('django.db.models.fields.IntegerField')(unique=True, max_length=100)),
            ('semestr', self.gf('django.db.models.fields.CharField')(default=('1, 2', '1, 2'), max_length=6)),
        ))
        db.send_create_signal('tariffication', ['Groups'])

        # Adding model 'Groups_stud'
        db.create_table('groups_stud', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('group', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['tariffication.Groups'])),
            ('student', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['tariffication.Students'])),
        ))
        db.send_create_signal('tariffication', ['Groups_stud'])

        # Adding model 'Groups_plan'
        db.create_table('groups_plan', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('year', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['tariffication.Year'])),
            ('group', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['tariffication.Groups'])),
            ('course', self.gf('django.db.models.fields.IntegerField')(default=1)),
        ))
        db.send_create_signal('tariffication', ['Groups_plan'])

        # Adding model 'Tariffication'
        db.create_table('tariffication', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('teacher', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['tariffication.Teachers'])),
            ('group_plan', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['tariffication.Groups_plan'])),
            ('uch_plan_hour', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['tariffication.UchPlanHour'])),
        ))
        db.send_create_signal('tariffication', ['Tariffication'])


    def backwards(self, orm):
        
        # Deleting model 'Profile'
        db.delete_table('profile')

        # Deleting model 'Students'
        db.delete_table('students')

        # Deleting model 'Teachers'
        db.delete_table('teachers')

        # Deleting model 'UserStatus'
        db.delete_table('user_status')

        # Deleting model 'Group'
        db.delete_table('group')

        # Removing M2M table for field status on 'Group'
        db.delete_table('group_status')

        # Deleting model 'UserPost'
        db.delete_table('user_post')

        # Removing M2M table for field status on 'UserPost'
        db.delete_table('user_post_status')

        # Deleting model 'PO'
        db.delete_table('po')

        # Deleting model 'Speciality'
        db.delete_table('speciality')

        # Deleting model 'Disc_type'
        db.delete_table('disc_type')

        # Deleting model 'Discipline'
        db.delete_table('discipline')

        # Deleting model 'UchPlan'
        db.delete_table('uch_plan')

        # Deleting model 'UchPlanHour'
        db.delete_table('uch_plan_hour')

        # Deleting model 'Year'
        db.delete_table('year')

        # Deleting model 'Groups'
        db.delete_table('groups')

        # Deleting model 'Groups_stud'
        db.delete_table('groups_stud')

        # Deleting model 'Groups_plan'
        db.delete_table('groups_plan')

        # Deleting model 'Tariffication'
        db.delete_table('tariffication')


    models = {
        'auth.group': {
            'Meta': {'object_name': 'Group'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '80'}),
            'permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'})
        },
        'auth.permission': {
            'Meta': {'ordering': "('content_type__app_label', 'content_type__model', 'codename')", 'unique_together': "(('content_type', 'codename'),)", 'object_name': 'Permission'},
            'codename': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['contenttypes.ContentType']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        'auth.user': {
            'Meta': {'object_name': 'User'},
            'date_joined': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 4, 29, 19, 56, 26, 30263)'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'groups': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Group']", 'symmetrical': 'False', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'is_staff': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'is_superuser': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'last_login': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 4, 29, 19, 56, 26, 30146)'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'user_permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'}),
            'username': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'})
        },
        'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'tariffication.disc_type': {
            'Meta': {'object_name': 'Disc_type', 'db_table': "'disc_type'"},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '150'})
        },
        'tariffication.discipline': {
            'Meta': {'object_name': 'Discipline', 'db_table': "'discipline'"},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '150'}),
            'short_name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.Disc_type']"})
        },
        'tariffication.group': {
            'Meta': {'object_name': 'Group', 'db_table': "'group'", '_ormbases': ['auth.Group']},
            'describe': ('django.db.models.fields.CharField', [], {'max_length': '150'}),
            'group_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['auth.Group']", 'unique': 'True', 'primary_key': 'True'}),
            'status': ('django.db.models.fields.related.ManyToManyField', [], {'symmetrical': 'False', 'to': "orm['tariffication.UserStatus']", 'null': 'True', 'blank': 'True'})
        },
        'tariffication.groups': {
            'Meta': {'object_name': 'Groups', 'db_table': "'groups'"},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.IntegerField', [], {'unique': 'True', 'max_length': '100'}),
            'semestr': ('django.db.models.fields.CharField', [], {'default': "('1, 2', '1, 2')", 'max_length': '6'}),
            'spec': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.Speciality']"})
        },
        'tariffication.groups_plan': {
            'Meta': {'object_name': 'Groups_plan', 'db_table': "'groups_plan'"},
            'course': ('django.db.models.fields.IntegerField', [], {'default': '1'}),
            'group': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.Groups']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'year': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.Year']"})
        },
        'tariffication.groups_stud': {
            'Meta': {'object_name': 'Groups_stud', 'db_table': "'groups_stud'"},
            'group': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.Groups']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'student': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.Students']"})
        },
        'tariffication.po': {
            'Meta': {'object_name': 'PO', 'db_table': "'po'"},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '150'})
        },
        'tariffication.profile': {
            'Meta': {'object_name': 'Profile', 'db_table': "'profile'", '_ormbases': ['auth.User']},
            'b_day': ('django.db.models.fields.DateField', [], {'null': 'True', 'blank': 'True'}),
            'other_name': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'phone': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'sex': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'user_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['auth.User']", 'unique': 'True', 'primary_key': 'True'})
        },
        'tariffication.speciality': {
            'Meta': {'object_name': 'Speciality', 'db_table': "'speciality'"},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '150'}),
            'num_spec': ('django.db.models.fields.FloatField', [], {'max_length': '100'})
        },
        'tariffication.students': {
            'Meta': {'object_name': 'Students', 'db_table': "'students'", '_ormbases': ['tariffication.Profile']},
            'cart': ('django.db.models.fields.IntegerField', [], {}),
            'profile_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['tariffication.Profile']", 'unique': 'True', 'primary_key': 'True'})
        },
        'tariffication.tariffication': {
            'Meta': {'object_name': 'Tariffication', 'db_table': "'tariffication'"},
            'group_plan': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.Groups_plan']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'teacher': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.Teachers']"}),
            'uch_plan_hour': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.UchPlanHour']"})
        },
        'tariffication.teachers': {
            'Meta': {'object_name': 'Teachers', 'db_table': "'teachers'", '_ormbases': ['tariffication.Profile']},
            'cabinet': ('django.db.models.fields.IntegerField', [], {}),
            'profile_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['tariffication.Profile']", 'unique': 'True', 'primary_key': 'True'})
        },
        'tariffication.uchplan': {
            'Meta': {'object_name': 'UchPlan', 'db_table': "'uch_plan'"},
            'disc': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.Discipline']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'otch': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'semestr': ('django.db.models.fields.IntegerField', [], {'max_length': '100'}),
            'spec': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.Speciality']"})
        },
        'tariffication.uchplanhour': {
            'Meta': {'object_name': 'UchPlanHour', 'db_table': "'uch_plan_hour'"},
            'count_hours': ('django.db.models.fields.IntegerField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'type': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'uch_plan': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.UchPlan']", 'max_length': '100'})
        },
        'tariffication.userpost': {
            'Meta': {'object_name': 'UserPost', 'db_table': "'user_post'"},
            'date_begin': ('django.db.models.fields.DateField', [], {}),
            'date_end': ('django.db.models.fields.DateField', [], {'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'status': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['tariffication.UserStatus']", 'symmetrical': 'False'}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['auth.User']"})
        },
        'tariffication.userstatus': {
            'Meta': {'object_name': 'UserStatus', 'db_table': "'user_status'"},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'tariffication.year': {
            'Meta': {'object_name': 'Year', 'db_table': "'year'"},
            'date_begin': ('django.db.models.fields.DateField', [], {}),
            'date_end': ('django.db.models.fields.DateField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        }
    }

    complete_apps = ['tariffication']
