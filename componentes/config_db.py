import mysql.connector

config_dev = {
    'user':'root',
    'password':'',
    'host':'127.0.0.1',
    'database':'db_ropa'
}
conexion = mysql.connector.connect(**config_dev)