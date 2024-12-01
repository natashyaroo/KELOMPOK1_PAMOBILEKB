import numpy as np
import pandas as pd
import joblib
import tensorflow as tf

class Model:
    def __init__(self, model_path):
        # Load model
        self.model = tf.keras.models.load_model(model_path)
        
        # Load scaler (diasumsikan disimpan dengan joblib)
        scaler_path = model_path.replace('.h5', '_scaler.pkl')
        self.scaler = joblib.load(scaler_path)
        
        # Definisi label kelas
        self.class_labels = ['Low', 'Mid', 'High']

    def predict_from_data(self, data):
        """
        Metode untuk memprediksi kelas laptop dari data input
        
        Args:
            data (dict): Dictionary berisi fitur laptop
        
        Returns:
            dict: Hasil prediksi dengan kelas dan confidence
        """
        # Validasi input
        required_features = [
            'Penyimpanan', 
            'RAM_Numeric', 
            'Harga', 
            'Tier VGA', 
            'Tier Processor'
        ]

        # Cek kelengkapan fitur
        for feature in required_features:
            if feature not in data:
                raise ValueError(f'Missing required feature: {feature}')

        # Persiapan data input
        input_data = np.array([
            data['Penyimpanan'],
            data['RAM_Numeric'],
            data['Harga'],
            data['Tier VGA'],
            data['Tier Processor']
        ]).reshape(1, -1)

        # Scaling data input
        input_data_scaled = self.scaler.transform(input_data)

        # Prediksi
        prediction = self.model.predict(input_data_scaled)
        
        # Konversi prediksi
        predicted_class_index = np.argmax(prediction)
        predicted_class = self.class_labels[predicted_class_index]
        confidence = np.max(prediction) * 100

        return {
            'class': predicted_class,
            'confidence': round(confidence, 2)
        }

    def predict_from_image(self, image):
        """
        Method ini tidak digunakan untuk model laptop classification
        Tetap disertakan untuk konsistensi interface
        """
        raise NotImplementedError("Image prediction is not supported for this model")

    @staticmethod
    def from_path(model_path):
        return Model(model_path)