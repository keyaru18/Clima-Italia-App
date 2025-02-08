import requests
import csv
import os
from datetime import datetime

# Coordenadas Italia
LATITUD = 42.8333
LONGITUD = 12.8333

API_KEY = 'c6042a031a2ae520ed01eeeb7116bc32'

# URL API con f-string para la interpolación
URL = f'http://api.openweathermap.org/data/2.5/weather?lat={LATITUD}&lon={LONGITUD}&appid={API_KEY}&units=metric'

# Archivo CSV 
ARCHIVO_CSV = 'clima-italia-hoy.csv'

def obtener_datos_climaticos():
    respuesta = requests.get(URL)
    datos = respuesta.json()
    print("Datos Añadidos correctamente")
    print(datos)
    return {
        'fecha_hora': datetime.now().strftime('%Y-%m-%d %H:%M:%S'),
        'temperatura': datos['main']['temp'],
        'humedad': datos['main']['humidity'],
        'presion': datos['main']['pressure'],
        'clima': datos['weather'][0]['main'],
        'estado_clima': datos['weather'][0]['description'],
        'ciudad': datos['name'],
        'pais': datos['sys']['country']
    }

def escribir_csv(datos):
    archivo_existe = os.path.isfile(ARCHIVO_CSV)
    
    with open(ARCHIVO_CSV, mode='a', newline='') as archivo:
        escritor = csv.DictWriter(archivo, fieldnames=datos.keys())
        
        if not archivo_existe:
            escritor.writeheader()
        
        escritor.writerow(datos)

def main():
    datos_climaticos = obtener_datos_climaticos()
    escribir_csv(datos_climaticos)

if __name__ == '__main__':
    main()
