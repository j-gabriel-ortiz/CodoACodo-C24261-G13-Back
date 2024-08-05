from app import app
from flask import jsonify
from base_db.datos import obtener_datos, obtener_img_exp


@app.route('/api/datos') # http://127.0.0.1:5000/api/datos
def mostrar_datos():
    return jsonify(obtener_datos())

@app.route('/api/expo-ropa') # http://127.0.0.1:5000/api/expo-ropa
def exposicion():
    return jsonify(obtener_img_exp())