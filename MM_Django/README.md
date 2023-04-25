**Do migration to setup database.**<br /><br />

In MM_Django, (same level with manage.py)
```
python manage.py makemigrations
python manage.py migrate
```

Start to run it; open http://127.0.0.1:8000/ on your browser<br />
```
python manage.py runserver
```

I've prepared a test user, so just input below info in login page:
>Email address: 1@1<br />
password: 1
