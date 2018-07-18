from django.contrib import admin
from django.urls import path, include

from . import views

urlpatterns = [
    path('', views.index),
    path('hoge/', include('hoge.urls')),
    path('fuga/<foo>', views.fuga),
    path('search', views.search),
    path('form', views.form),
    path('upload', views.upload),
    path('admin/', admin.site.urls)
]
