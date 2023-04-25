from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from .models import User

def login_user(request):
    if request.method == "POST":
        email = request.POST['email']
        password = request.POST['password']
        user = authenticate(request, username=email, password=password)
        if user is not None:
            login(request, user)
            data_user = User.objects.filter(u_email=email)
            return render(request, 'home.html', {'data_user':data_user})
        else:
            messages.error(request, ("Failed to log in. Please try again."))
            return redirect('login')
    else:
        return render(request, 'authentication/login.html', {})
    
def home(request):
    return render(request, 'home.html', {})

def recommend(request):
    return render(request, 'recommend.html', {})