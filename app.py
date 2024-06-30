from flask import Flask
from flask import jsonify

from componentes.datos import obtener_datos

app = Flask(__name__)

@app.route('/')
def inicio():
    return "<h1>Bienvenid@s a Flask</h1>"

@app.route('/api/datos') # http://127.0.0.1:5000/api/datos-ropa
def mostrar_datos():
    return jsonify(obtener_datos())

if __name__ == "main":
    app.run()