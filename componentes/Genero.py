from base_db.CRUD import CRUD
from base_db.config_db import conexion as con

class Genero(CRUD):
    #Atributos de clase
    tabla = 'tipo_ropa'
    campos = ('id_tipo', 'ropa_para')
    conexion = con
    
    def __init__(self, valores):
        super().crear(valores)