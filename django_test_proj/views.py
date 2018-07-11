from django.http import HttpResponse
from django.shortcuts import render

def index(request):
    return render(request, './index.html', {'title': 'Hello World'})

def hoge(request):
    return HttpResponse("Hoge")

def fuga(request, foo):
    return render(request, './index.html', {'title': foo})