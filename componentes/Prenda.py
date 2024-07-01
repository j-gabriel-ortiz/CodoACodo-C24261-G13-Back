from base_db.CRUD import CRUD
from base_db.config_db import conexion as con

class Prenda(CRUD):
    #Atributos de clase
    tabla = 'detalles_ropa'
    campos = (
        'id_ropa',
        'img_ropa', 
        'nombre_ropa',
        'precio_ropa'
    )
    conexion = con

    def __init__(self, valores):
        super().crear(valores)