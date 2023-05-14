from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from .models import User, Restaurant, Record, City

def login_user(request):
    if request.method == "POST":
        email = request.POST['email']
        password = request.POST['password']
        user = authenticate(request, username=email, password=password)
        if user is not None:
            login(request, user)
            data_user = User.objects.filter(u_email=email)
            return render(request, 'home.html', {'data_user': data_user})
        else:
            messages.error(request, ("Failed to log in. Please try again."))
            return redirect('login')
    else:
        return render(request, 'authentication/login.html', {})

def logout_user(request):
    logout(request)
    return redirect('login')

def home(request):
    return render(request, 'home.html', {})


def rate(request):
    current_user = request.user
    data_restaurant = Restaurant.objects.all()
    data_record = Record.objects.filter(u=current_user.id)
    return render(request, 'rate.html', {'data_restaurant': data_restaurant,
                                         'data_record' : data_record})

def rate_a_restaurant(request):
    # current_user = request.user
    rating = request.GET.get('rating', 1)
    r_id = request.GET.get('r_id', '')
    u_id = 2
    
    Record_db = Record.objects.create(rating=rating, r_id=r_id, u_id=u_id)
    Record_db.save()
    return render(request, 'rate_a_restaurant.html', {})
    

def rate_history(request):
    data_record = Record.objects.select_related('u', 'r')
    return render(request, 'rate_history.html', {'data_record': data_record})


def recommend(request):
    data_restaurant = Restaurant.objects.all()
    
    type_ = request.GET.get('type_', '')
    price = request.GET.get('price', '')
    location = request.GET.get('location', '')
    
    if type_:
        data_restaurant = data_restaurant.filter(r_type=type_)
    if price:
        data_restaurant = data_restaurant.filter(r_price=price)
    if location:
        data_restaurant = data_restaurant.filter(c_id=location)
        
    return render(request, 'recommend.html', {'data_restaurant': data_restaurant,
                                              'type_': type_,
                                              'price': price,
                                              'location': location} )