from .User import UserDB

class ModelUserDB(UserDB):

    @classmethod
    def login(self, conexion, user_name):
        
        # Conexion a db
        try:
            cursor = conexion.cursor(dictionary=True)
        except Exception as e:
            conexion.connect()
            cursor = conexion.cursor(dictionary=True)
        
        # Consulta y datos db
        consulta = f"""SELECT * FROM usuario_verificado
                        WHERE user_name = %s;"""
        valores = (user_name.username,)
        cursor.execute(consulta, valores)
        dato = cursor.fetchall()

        cursor.close()
        # Validacion de usuario
        if dato:
            user = UserDB(dato[0]['id_user'], dato[0]['user_name'], dato[0]['user_password'])
            return user
        else:
            return None
        
    @classmethod
    def get_by_id(self, conexion, id):
        
        # Conexion a db
        try:
            cursor = conexion.cursor(dictionary=True)
        except Exception as e:
            conexion.connect()
            cursor = conexion.cursor(dictionary=True)
        
        # Consulta y datos db
        consulta = f"""SELECT * FROM usuario_verificado WHERE id_user = %s;"""
        valores = (id,)
        cursor.execute(consulta, valores)
        dato = cursor.fetchall()

        cursor.close()
        # Validacion de usuario
        if dato:
            user = UserDB(dato[0]['id_user'], dato[0]['user_name'], dato[0]['user_password'])
            return user
        else:
            return None