from flask import flash, render_template, request, redirect, url_for
from flask_login import LoginManager, login_user, logout_user, login_required
from werkzeug.security import check_password_hash
from base_db.datos import obtener_datos
from app import app
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
    talles = request.form.getlist('talles_db')
    genero = request.form.get('genero_db')
    precio = request.form.get('precio_db')

    conexion = con
    try:
        cursor = conexion.cursor()
    except Exception as e:
        conexion.connect()
        cursor = conexion.cursor()
    
    #Insertar en detalles ropa
    cursor.execute("SELECT MAX(id_ropa) FROM detalles_ropa")
    max_id_prenda = int(cursor.fetchone()[0]) + 1
    
    consulta = f"INSERT INTO detalles_ropa VALUES (%s, %s, %s, %s);"
    valores = (max_id_prenda, imagen, nombre, precio)
    cursor.execute(consulta, valores)
    conexion.commit()

    #Insertar en talles
    cursor.execute("SELECT MAX(id_detalles_talles) FROM detalles_talles")
    max_id_talle = int(cursor.fetchone()[0]) + 1
    
    # La funcion genera una lista con tuplas que contienen id, talle y si tiene ese talle o no
    valores_talles = talles_consulta(talles, max_id_prenda)
    consulta_talles = f"INSERT INTO detalles_talles VALUES (%s, %s, %s, %s);"
    for i in valores_talles:
        max_id_talle = max_id_talle + 1
        cursor.execute(consulta_talles, (max_id_talle, i[0],i[1],i[2]))
        conexion.commit()

    #Insertar en tipo
    cursor.execute("SELECT MAX(id_detalles_tipo) FROM detalles_tipo")
    max_id_tipo = int(cursor.fetchone()[0]) + 1
    
    genero_lista = genero.split(',')
    valores_genero = genero_ropa_consulta(genero_lista, max_id_prenda)
    consulta_genero = f"INSERT INTO detalles_tipo VALUES (%s, %s, %s);"
    for i in valores_genero:
        cursor.execute(consulta_genero, (max_id_tipo, i[0], i[1]))
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
    talles = request.form.getlist('modal-talles')
    generos = request.form.get('modal-generos')

    conexion = con
    try:
        cursor = conexion.cursor()
    except Exception as e:
        conexion.connect()
        cursor = conexion.cursor()

    valores_talles = talles_consulta(talles, id)

    print(valores_talles)

    tablas = ("detalles_ropa", "detalles_talles", "detalles_tipo")

    for tabla in tablas:
        if tabla == "detalles_ropa":
            consulta = f"UPDATE detalles_ropa SET img_ropa = %s, nombre_ropa = %s, precio_ropa = %s WHERE id_ropa = %s;"
            valores = (imagen,nombre,precio,id)
            cursor.execute(consulta, valores)
            conexion.commit()

        elif tabla == "detalles_talles":
            consulta = f"UPDATE detalles_talles SET validacion_talle = %s WHERE id_ropa = %s AND id_talles = %s;"
            valores_talles = talles_consulta(talles, id)
            for i in valores_talles:
                cursor.execute(consulta, (i[2],i[0],i[1]))
                conexion.commit()

        elif tabla == "detalles_tipo":
            genero_lista = generos.split(',')
            valores_genero = genero_ropa_editar(genero_lista, id)
            consulta_talles = f"UPDATE detalles_tipo SET id_tipo = %s WHERE id_ropa = %s;"
            for i in valores_genero:
                cursor.execute(consulta_talles, i)
                conexion.commit()
    
    cursor.close()
    return redirect(url_for('dashboard'))

def status_404(error):
    return '<h1>Pagina no encontrada</h1>', 404

def status_401(error):
    return redirect(url_for('login'))

app.register_error_handler(401, status_401)
app.register_error_handler(404, status_404)