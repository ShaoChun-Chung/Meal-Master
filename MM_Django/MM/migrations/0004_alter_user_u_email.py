# Generated by Django 3.2.9 on 2023-04-25 07:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('MM', '0003_auto_20230423_2254'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='u_email',
            field=models.EmailField(max_length=254, unique=True),
        ),
    ]