import mysql.connector

config_dev = {
    'user':'root',
    'password':'',
    'host':'127.0.0.1',
    'database':'db_ropa'
}

config_prod = {
    'user':'GabrielJO',
    'password':'olimpo123',
    'host':'GabrielJO.mysql.pythonanywhere-services.com',
    'database':'GabrielJO$db_ropa'
}
conexion = mysql.connector.connect(**config_dev)