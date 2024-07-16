from flask import flash, render_template, request, redirect, url_for
from flask_login import LoginManager, login_user, logout_user, login_required
from werkzeug.security import check_password_hash
from base_db.datos import obtener_datos
from main import app
from base_db.config_db import conexion as con, conexion_user as con_user
from auxiliares.funciones import genero_ropa_editar, talles_consulta, genero_ropa_consulta
from .ModelUser import ModelUserDB
from .User import UserDB

login_manager_app = LoginManager(app)

@login_manager_app.user_loader
def load_user(id_user):
    conexion = con_user
    return ModelUserDB.get_by_id(conexion, id_user)

@app.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('login'))

@app.route('/')
def inicio():
    return redirect(url_for('login'))

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        # Datos ingresados
        user_log = request.form['user']
        clave = request.form['password']

        # Conexion a db
        conexion = con_user

        user_db = UserDB(0, user_log, clave)
        logged_user = ModelUserDB.login(conexion, user_db)
        if logged_user != None:
            if check_password_hash(logged_user.password, user_db.password):
                login_user(logged_user)
                return redirect(url_for('dashboard'))
            else:
                flash('Clave invalida...')
                return render_template('./login.html')
        else:
            flash('Usuario invalido...')
            return render_template('./login.html')
    else:
        return render_template('./login.html')

@app.route('/dashboard')
@login_required
def dashboard():
    datos = obtener_datos()  
    talles_ordenados = ordenar_talles(datos) 
    return render_template('./dashboard.html', datos=datos, talles_ordenados=talles_ordenados)

def ordenar_talles(datos):
    orden_talles = {'xs': 1, 's': 2, 'm': 3, 'l': 4, 'xl': 5, 'xxl': 6}

    def ordenar_talles_item(item):
        talles_lista = item['talles'].split(',')
        talles_ordenados = sorted(talles_lista, key=lambda talle: orden_talles.get(talle, float('inf')))
        return ', '.join(talles_ordenados)

    return [ordenar_talles_item(item) for item in datos]

######### Funcion Agregar #########
@app.route('/add-prenda', methods=["POST"])
def addPrenda():
    nombre = request.form.get('nombre_db')
    imagen = request.form.get('img_db')
    talles = request.form.get('talles_db')
    genero = request.form.get('genero_db')
    precio = request.form.get('precio_db')

    conexion = con
    try:
        cursor = conexion.cursor()
    except Exception as e:
        conexion.connect()
        cursor = conexion.cursor()
    
    #Insertar en detalles ropa
    consulta = f"INSERT INTO detalles_ropa (img_ropa, nombre_ropa, precio_ropa) VALUES (%s, %s, %s);"
    valores = (imagen, nombre, precio)
    cursor.execute(consulta, valores)
    conexion.commit()

    #Busca id recien creado
    consulta_id = f"SELECT * FROM detalles_ropa WHERE nombre_ropa = %s;"
    nombre_ropa = (nombre,)
    cursor.execute(consulta_id, nombre_ropa)
    dato_id = cursor.fetchall()
    
    #id prenda
    new_id = dato_id[0][0]
  
    #Datos para la consulta, la funcion genera una tupla con tuplas con el id y talle (por cada talle)
    talles_lista = talles.split(',')
    valores_talles = talles_consulta(talles_lista, new_id)
    consulta_talles = f"INSERT INTO detalles_talles (id_ropa, id_talles) VALUES (%s, %s);"
    for i in valores_talles:
        cursor.execute(consulta_talles, i)
        conexion.commit()

    genero_lista = genero.split(',')
    valores_genero = genero_ropa_consulta(genero_lista, new_id)
    consulta_genero = f"INSERT INTO detalles_tipo (id_ropa, id_tipo) VALUES (%s, %s);"
    for i in valores_genero:
        cursor.execute(consulta_genero, i)
        conexion.commit()

    cursor.close()
    return redirect(url_for('dashboard'))

######### Funcion Eliminar #########
@app.route('/deletePrenda/<string:id>')
def deletePrenda(id):
    conexion = con
    try:
        cursor = conexion.cursor()
    except Exception as e:
        conexion.connect()
        cursor = conexion.cursor()

    tablas = ("detalles_talles","detalles_tipo","detalles_ropa")

    for tabla in tablas:
        consulta = f"DELETE FROM {tabla} WHERE id_ropa = %s;"
        valores = (id,)
        cursor.execute(consulta, valores)
        conexion.commit()
    
    cursor.close()
    return redirect(url_for('dashboard'))

######### Funcion Editar #########
@app.route('/editarPrenda', methods=["POST"])
def editarPrenda():
    id = request.form.get('modal-id_db')
    nombre = request.form.get('modal-nombre_db')
    imagen = request.form.get('modal-img_db')
    precio = request.form.get('modal-precio_db')
    talles = request.form.get('modal-talles')
    generos = request.form.get('modal-generos')

    conexion = con
    try:
        cursor = conexion.cursor()
    except Exception as e:
        conexion.connect()
        cursor = conexion.cursor()
    tablas = ("detalles_ropa", "detalles_talles", "detalles_tipo")

    for tabla in tablas:
        if tabla == "detalles_ropa":
            consulta = f"UPDATE detalles_ropa SET img_ropa = %s, nombre_ropa = %s, precio_ropa = %s WHERE id_ropa = %s;"
            valores = (imagen,nombre,precio,id)
            cursor.execute(consulta, valores)
            conexion.commit()
        elif tabla == "detalles_talles":
            consulta_borrar = f"DELETE FROM detalles_talles WHERE id_ropa = %s;"
            valores = (id,)
            cursor.execute(consulta_borrar, valores)
            conexion.commit()

            talles_lista = talles.split(',')
            valores_talles = talles_consulta(talles_lista, id)
            consulta_talles = f"INSERT INTO detalles_talles (id_ropa, id_talles) VALUES (%s, %s);"
            for i in valores_talles:
                cursor.execute(consulta_talles, i)
                conexion.commit()
        elif tabla == "detalles_tipo":
            genero_lista = generos.split(',')
            valores_genero = genero_ropa_editar(genero_lista, id)
            consulta = f"UPDATE detalles_tipo SET id_tipo = %s WHERE id_ropa = %s;"
            for i in valores_genero:
                cursor.execute(consulta, i)
                conexion.commit()
    
    cursor.close()
    return redirect(url_for('dashboard'))

def status_404(error):
    return '<h1>Pagina no encontrada</h1>', 404

def status_401(error):
    return redirect(url_for('login'))

app.register_error_handler(401, status_401)
app.register_error_handler(404, status_404)