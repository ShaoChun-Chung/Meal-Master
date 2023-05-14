from django.urls import path
from . import views

urlpatterns = [
    path('', views.login_user, name="login"),
    path('home', views.home, name="home"),
    path('recommend', views.recommend, name="recommend"),   
    path('logout', views.logout_user, name="logout"),
    path('rate', views.rate, name="rate"),
    path('rate_a_restaurant', views.rate_a_restaurant, name="rate_a_restaurant"),
    path('rate_history', views.rate_history, name="rate_history"),
]