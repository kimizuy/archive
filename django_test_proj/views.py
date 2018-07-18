from django.http import HttpResponse
from django.shortcuts import render


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
    if request.method == 'POST' and request.FILES and request.FILES['image']:
        binary = request.FILES['image']
        image = open('static/hoge.png', 'wb')
        for chunk in binary.chunks():
            image.write(chunk)
        return render(request, 'result.html')
    else:
        return HttpResponseRedirect("/form")
