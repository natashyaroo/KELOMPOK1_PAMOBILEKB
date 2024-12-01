import json
import numpy as np
import joblib
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt


model = joblib.load('api/model/laptop/laptop_classification_model.h5')
scaler = joblib.load('api/model/laptop/laptop_scaler.pkl')


CLASS_LABELS = ['Low', 'Mid', 'High']

@csrf_exempt
def predict_laptop(request):
    if request.method == 'POST':
        try:

            data = json.loads(request.body.decode('utf-8'))
            user_data = data.get('data')
            required_features = [
                'Penyimpanan', 
                'RAM_Numeric', 
                'Harga', 
                'Tier VGA', 
                'Tier Processor'
            ]

            for feature in required_features:
                if feature not in user_data:
                    return JsonResponse({
                        'error': f'Missing required feature: {feature}', 
                        'status': 'failed'
                    }, status=400)

            input_data = np.array([
                user_data['Penyimpanan'],
                user_data['RAM_Numeric'],
                user_data['Harga'],
                user_data['Tier VGA'],
                user_data['Tier Processor']
            ]).reshape(1, -1)

            input_data_scaled = scaler.transform(input_data)

            prediction = model.predict(input_data_scaled)

            predicted_class = CLASS_LABELS[np.argmax(prediction)]
            confidence = np.max(prediction) * 100

            return JsonResponse({
                'message': 'Prediction successful',
                'prediction': {
                    'class': predicted_class,
                    'confidence': round(confidence, 2)
                },
                'status': 'success'
            }, status=200)

        except json.JSONDecodeError:
            return JsonResponse({
                'error': 'Invalid JSON format', 
                'status': 'failed'
            }, status=400)
        
        except Exception as e:
            return JsonResponse({
                'error': str(e), 
                'status': 'failed'
            }, status=500)
    
    else:
        return JsonResponse({
            'error': 'This endpoint only supports POST requests',
            'status': 'failed'
        }, status=405)

@csrf_exempt
def predict_example(request):
    if request.method == 'GET':
        example_input = {
            'data': {
                'Penyimpanan': 512,    
                'RAM_Numeric': 16,    
                'Harga': 10000000,    
                'Tier VGA': '2',      
                'Tier Processor': '2'  
            }
        }
        return JsonResponse(example_input, status=200)
    else:
        return JsonResponse({
            'error': 'This endpoint only supports GET requests',
            'status': 'failed'
        }, status=405)