from main import app
from flask import jsonify
from base_db.datos import obtener_datos
from componentes.Prenda import Prenda
from componentes.Talle import Talle
from componentes.Genero import Genero


@app.route('/api/datos') # http://127.0.0.1:5000/api/datos
def mostrar_datos():
    return jsonify(obtener_datos())

@app.route('/api/ropa') # http://127.0.0.1:5000/api/ropa
def mostrar_ropa():
    ropa = Prenda.obtener()
    lista_ropa = []
    for item in ropa:
        dic_ropa = {
            "id" : item.id_ropa,
            "img" : item.img_ropa,
            "nombre" : item.nombre_ropa,
            "precio" : item.precio_ropa
        }

        lista_ropa.append(dic_ropa)
    
    return lista_ropa