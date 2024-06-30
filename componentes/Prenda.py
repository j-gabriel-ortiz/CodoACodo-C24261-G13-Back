import componentes.config_db

class Prenda:
    #Atributos de clase
    tabla = 'detalles_ropa'
    campos = (
        'img_ropa', 
        'nombre_ropa',
        'precio_ropa'
    )
    conexion = componentes.config_db.conexion

    #Metodo constructor
    def __init__(self, nombre, img, precio):
        self.nombre = nombre
        self.img = img
        self.precio = precio

    def guardar_db(self):
        self.conexion.connect()
        cursor = self.conexion.cursor()
        consulta = f"INSER INTO {self.tabla} {str(self.campos).replace("'","`")} VALUES (%s, %s, %d)"
        datos = (self.nombre, self.img, self.precio)
        cursor.execute(consulta, datos)
        self.conexion.commit()
        self.conexion.close()
    
    @classmethod
    def obtener_todos(cls):
        cls.conexion.connect()
        cursor = cls.conexion.cursor(dictionary=True)
        consulta = f"SELECT * FROM {cls.tabla}"
        cursor.execute(consulta)
        datos = cursor.fetchall()
        cls.conexion.close()
        return datos
    
    @classmethod
    def actualizar(cls, id, nombre, img, precio):
        cls.conexion.connect()
        cursor = cls.conexion.cursor()
        consulta = f"UPDATE {cls.tabla} WHERE id = %s 
                    SET nombre_ropa = %s, img_ropa = %s, 
                    precio_ropa = %d"
        datos = (id, nombre, img, precio)
        cursor.execute(consulta, datos)
        cls.conexion.commit()
        cls.conexion.close()

print(Prenda.obtener_todos())