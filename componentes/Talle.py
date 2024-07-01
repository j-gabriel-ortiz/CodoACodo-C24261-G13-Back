from base_db.CRUD import CRUD
from base_db.config_db import conexion as con

class Talle(CRUD):
    #Atributos de clase
    tabla = 'talles_ropa'
    campos = ('id_talles','talle_ropa')
    conexion = con

    def __init__(self, valores):
        super().crear(valores)