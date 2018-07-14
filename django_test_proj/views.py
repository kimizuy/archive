from django.http import HttpResponse
from django.shortcuts import render

def index(request):
    return render(request, 'templates/index.html', {'title': 'Hello World'})

def hoge(request):
    return HttpResponse("Hoge")

def fuga(request, foo):
    return render(request, 'templates/index.html', {'title': foo})

def search(request):
    q = request.GET.get('q')
    return HttpResponse(q)