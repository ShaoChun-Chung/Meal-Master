from django.db import models

# Create your models here.

class User(models.Model):
    u_id = models.AutoField(primary_key=True)
    u_email = models.EmailField(blank=False, unique=True)
    u_password = models.CharField(max_length=100, blank=False)
    u_name = models.CharField(max_length=100, blank=False)
    u_gender = models.CharField(max_length=10, blank=False)
    u_birth = models.DateTimeField(blank=False)
    c = models.ForeignKey("City", on_delete=models.CASCADE)
    
class City(models.Model):
    c_id = models.AutoField(primary_key=True)
    c = models.CharField(unique=True, max_length=254, blank=False)
    
class Restaurant(models.Model):
    r_id = models.AutoField(primary_key=True)
    r_name = models.CharField(max_length=100, blank=False, unique=True)
    r_type = models.CharField(max_length=100)
    r_price = models.CharField(max_length=100)
    r_address = models.CharField(max_length=254)
    c = models.ForeignKey("City", on_delete=models.CASCADE)

class Record(models.Model):
    rating = models.IntegerField(blank=False)
    u = models.ForeignKey("User", on_delete=models.CASCADE)
    r = models.ForeignKey("Restaurant", on_delete=models.CASCADE)

    # def save(self): 
    #   "Get last value of Code and Number from database, and increment before save"
    #   top = Record.objects.order_by('-code','-number')[0]
    #   self.code = top.code + 1
    #   self.number = top.number + 1
    #   super(Product, self).save()