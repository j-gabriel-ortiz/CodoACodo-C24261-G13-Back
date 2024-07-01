from main import app
from flask import jsonify
from base_db.datos import obtener_datos
from componentes.Prenda import Prenda
from componentes.Talle import Talle
from componentes.Genero import Genero


@app.route('/api/datos') # http://127.0.0.1:5000/api/datos
def mostrar_datos():
    return jsonify(obtener_datos())