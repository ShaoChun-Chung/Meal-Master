from django.contrib import admin

# Register your models here.
from .models import User, City, Restaurant, Record 

admin.site.register(User)
admin.site.register(City)
admin.site.register(Record)
admin.site.register(Restaurant)
