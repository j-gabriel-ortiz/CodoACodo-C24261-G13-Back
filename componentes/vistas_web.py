from flask import render_template
import requests
from main import app
from componentes.Prenda import Prenda
from componentes.Talle import Talle
from componentes.Genero import Genero

@app.route('/')
def inicio():
    api_url = 'http://127.0.0.1:5000/api/datos'
    respuesta = requests.get(api_url)
    datos_ropa = Prenda.obtener()
    datos_talles = Talle.obtener()
    datos_genero = Genero.obtener()
    return render_template('./index.html', datos=respuesta.json())