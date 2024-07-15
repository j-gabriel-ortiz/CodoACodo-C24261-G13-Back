from base_db.config_db import conexion as con

def obtener_datos():
    conexion = con
    try:
        cursor = conexion.cursor(dictionary=True)
    except Exception as e:
        conexion.connect()
        cursor = conexion.cursor(dictionary=True)
        
    consulta = """
    SELECT detalles_ropa.id_ropa AS id, detalles_ropa.nombre_ropa AS prenda,
            detalles_ropa.img_ropa AS img, detalles_ropa.precio_ropa AS precio,
            GROUP_CONCAT(talles_ropa.talle_ropa) AS talles, tipo_ropa.ropa_para AS genero
    FROM detalles_ropa
    INNER JOIN detalles_talles ON detalles_ropa.id_ropa = detalles_talles.id_ropa
    INNER JOIN talles_ropa ON detalles_talles.id_talles = talles_ropa.id_talles
    INNER JOIN detalles_tipo ON detalles_ropa.id_ropa = detalles_tipo.id_ropa
    INNER JOIN tipo_ropa ON detalles_tipo.id_tipo = tipo_ropa.id_tipo
    GROUP BY detalles_ropa.id_ropa;
    """
    cursor.execute(consulta)
    datos = cursor.fetchall()
    con.close()
    return datos


def obtener_img_exp():
    conexion = con
    try:
        cursor = conexion.cursor(dictionary=True)
    except Exception as e:
        conexion.connect()
        cursor = conexion.cursor(dictionary=True)
        
    consulta = "SELECT * FROM img_exposicion_ropa;"
    cursor.execute(consulta)
    datos = cursor.fetchall()
    con.close()
    return datos