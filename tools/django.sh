# create project
mkdir LearnDjango 
cd LearnDjango

# create venv
python -m venv venv
source venv/bin/activate

# install django
pip install Django

# check
django-admin

# create project mypage
django-admin startproject mypage

# start server
python manage.py runserver

# create app challenges
python manage.py startapp challenges