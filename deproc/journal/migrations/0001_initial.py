# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding model 'Types_themes'
        db.create_table('types_themes', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=150)),
        ))
        db.send_create_signal('journal', ['Types_themes'])

        # Adding model 'Themes'
        db.create_table('themes', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('describe', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('tariffication', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['tariffication.Tariffication'])),
            ('type', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['journal.Types_themes'])),
            ('date_pub', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
        ))
        db.send_create_signal('journal', ['Themes'])

        # Adding model 'Assessment'
        db.create_table('assessment', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('mark', self.gf('django.db.models.fields.IntegerField')()),
            ('student', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['tariffication.Students'])),
            ('theme', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['journal.Themes'])),
            ('date_pub', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
        ))
        db.send_create_signal('journal', ['Assessment'])


    def backwards(self, orm):
        
        # Deleting model 'Types_themes'
        db.delete_table('types_themes')

        # Deleting model 'Themes'
        db.delete_table('themes')

        # Deleting model 'Assessment'
        db.delete_table('assessment')


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
            'date_joined': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 4, 29, 19, 57, 43, 607835)'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'groups': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['auth.Group']", 'symmetrical': 'False', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'is_staff': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'is_superuser': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'last_login': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2012, 4, 29, 19, 57, 43, 607711)'}),
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
        'journal.assessment': {
            'Meta': {'object_name': 'Assessment', 'db_table': "'assessment'"},
            'date_pub': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'mark': ('django.db.models.fields.IntegerField', [], {}),
            'student': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.Students']"}),
            'theme': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['journal.Themes']"})
        },
        'journal.themes': {
            'Meta': {'object_name': 'Themes', 'db_table': "'themes'"},
            'date_pub': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'describe': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'tariffication': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['tariffication.Tariffication']"}),
            'type': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['journal.Types_themes']"})
        },
        'journal.types_themes': {
            'Meta': {'object_name': 'Types_themes', 'db_table': "'types_themes'"},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '150'})
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
        'tariffication.year': {
            'Meta': {'object_name': 'Year', 'db_table': "'year'"},
            'date_begin': ('django.db.models.fields.DateField', [], {}),
            'date_end': ('django.db.models.fields.DateField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'})
        }
    }

    complete_apps = ['journal']
