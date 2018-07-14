from django.contrib import admin
from django.urls import path, include

from . import views

urlpatterns = [
    path('form', views.render_form),
    path('login', views.login),
    path('admin/', admin.site.urls)
]