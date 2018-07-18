from django.contrib import admin
from django.urls import path, include

from . import views

urlpatterns = [
    path('', views.index),
    path('hoge/', include('hoge.urls')),
    path('fuga/<foo>', views.fuga),
    path('upload', views.upload),
    path('form', views.form),
    path('search', views.search),
    path('admin/', admin.site.urls)
]
