from flask import render_template
from main import app
from base_db.datos import obtener_datos

@app.route('/')
def inicio():
    datos_ropa = obtener_datos()
    return render_template('./index.html', datos=datos_ropa)