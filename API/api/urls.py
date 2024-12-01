from django.urls import path
from .views import predict_laptop, predict_example

urlpatterns = [
    path('predict', predict_laptop, name='predict_laptop'),
    path('predict-example', predict_example, name='predict_example')
]