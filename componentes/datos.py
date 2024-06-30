from componentes.config_db import conexion

def obtener_datos():
        con = conexion
        cursor = con.cursor(dictionary=True)
        consulta = "SELECT detalles_ropa.nombre_ropa, detalles_ropa.img_ropa, detalles_ropa.precio_ropa, GROUP_CONCAT(talles_ropa.talle_ropa) AS talles FROM detalles_ropa INNER JOIN detalles_talles ON detalles_ropa.id_ropa = detalles_talles.id_ropa INNER JOIN talles_ropa ON detalles_talles.id_talles = talles_ropa.id_talles GROUP BY detalles_ropa.id_ropa;"
        cursor.execute(consulta)
        datos = cursor.fetchall()
        con.close()
        return datos