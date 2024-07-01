class CRUD:
    #Constructor
    def __init__(self, tabla_db, campos_db, conexion_db):
        self.tabla = tabla_db
        self.campos = campos_db
        self.conexion = conexion_db

    # *** Funciones CRUD ***

    # Crear
    def crear(self, valores):
        for campo, valor in zip(self.campos, valores):
            setattr(self, campo, valor)
    
    # Guardar
    def guardar_db(self):
        pass
    
    # Leer
    @classmethod
    def obtener(cls):
        consulta = f"SELECT * FROM {cls.tabla}"
        return cls.__conectar(consulta)
    
    # Modificar
    @classmethod
    def actualizar(cls):
        pass

    # Eliminar
    @classmethod
    def eliminar(cls):
        pass

    # Conexion con la base de datos
    @classmethod
    def __conectar(cls, consulta):
        try:
            cursor = cls.conexion.cursor()
        except Exception as e:
            cls.conexion.connect()
            cursor = cls.conexion.cursor()
        
        cursor.execute(consulta)
        datos = cursor.fetchall()

        resultado = [cls(dato) for dato in datos]
        return resultado

            
