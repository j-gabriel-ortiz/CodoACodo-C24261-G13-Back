import mysql.connector

config_dev = {
    'user':'root',
    'password':'',
    'host':'127.0.0.1',
    'database':'db_ropa'
}

config_dev_user = {
    'user':'root',
    'password':'',
    'host':'127.0.0.1',
    'database':'flask_login_user'
}

config_prod = {
    'user':'GabrielJO',
    'password':'olimpo123',
    'host':'GabrielJO.mysql.pythonanywhere-services.com',
    'database':'GabrielJO$db_ropa'
}

config_prod_user = {
    'user':'GabrielJO',
    'password':'olimpo123',
    'host':'GabrielJO.mysql.pythonanywhere-services.com',
    'database':'GabrielJO$flask_login_user'
}

conexion = mysql.connector.connect(**config_dev)
conexion_user = mysql.connector.connect(**config_dev_user)