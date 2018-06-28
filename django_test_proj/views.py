from django.http import HttpResponse


def index(request):
    return HttpResponse("Hello World")

def hoge(request):
    return HttpResponse("Hoge")

def fuga(request):
    return HttpResponse("Fuga")