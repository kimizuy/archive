from django.http import HttpResponse
from django.shortcuts import render
from hashlib import md5

def index(request):
    return render(request, 'index.html', {'title': 'Hello World'})

def hoge(request):
    return HttpResponse("Hoge")

def search(request):
    q = request.GET.get('q')
    return HttpResponse(q)

def fuga(request, foo):
    return render(request, 'index.html', {'title': foo})

def form(request):
    return render(request, 'form.html')

def upload(request):
    if request.method == 'POST' and request.FILES['image'] and (request.FILES['image'].content_type == "image/png" or request.FILES['image'].content_type == "image/jpeg"):
        extention = ".jpg"
        if request.FILES['image'].content_type == "image/png":
            extention = ".png"
        print(request.FILES['image'].name)
        filepath = 'static/' + md5(request.FILES['image'].name.encode('utf-8')).hexdigest() + extention
        image = open(filepath, 'wb')
        for chunk in request.FILES['image'].chunks():
            image.write(chunk)
        return render(request, 'result.html', {'filepath': filepath, 'name': 'Hoge'})