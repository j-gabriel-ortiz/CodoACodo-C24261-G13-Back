from flask import render_template, request
import requests
from main import app

@app.route('/')
def inicio():
    api_url = 'http://127.0.0.1:5000/api/datos'
    respuesta = requests.get(api_url)
    datos = respuesta.json()
    return render_template('./index.html', datos=datos)

@app.route('/modificacion-db')
def modificacion_db():
    
    return render_template('./modificacion-db.html')