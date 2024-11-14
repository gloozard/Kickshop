from flask import Flask, render_template,url_for,request,redirect, flash, session
from flask_login import LoginManager, logout_user,login_user
from flask_mysqldb import MySQL
from werkzeug.security import generate_password_hash
from datetime import datetime 
from config import config
from models.ModelUser import ModelUser
from models.entities.User import User


kickshop = Flask(__name__)
db      = MySQL(kickshop)
adminSesion = LoginManager(kickshop)

@adminSesion.user_loader
def cargarUsuario(id):
    return ModelUser.get_by_id(db,id)

@kickshop.route("/")
def home():

    return render_template('home.html')

@kickshop.route("/signup",methods=["GET","POST"])
def signup():
    if request.method == "POST":
        nombre= request.form["nombre"]
        correo= request.form["correo"]
        clave=request.form["clave"]
        clave_cifrada=generate_password_hash(clave)
        fechareg=datetime.now()
        reg_usuario=db.connection.cursor()
        reg_usuario.execute("INSERT INTO usuario(nombre,correo,clave,fechareg)  VALUES(%s,%s,%s,%s) ",(nombre,correo,clave_cifrada,fechareg))
        db.connection.commit()  
        return render_template('home.html')
    else:
        
        return render_template('signup.html')



@kickshop.route("/sUsuario", methods =["GET","POST"])
def sUsuario():
    selUsuario=db.connection.cursor()
    selUsuario.execute("SELECT * FROM usuario")
    u = selUsuario.fetchall()
    selUsuario.close()
    return render_template("usuarios.html", usuarios = u)


@kickshop.route("/signin", methods =["GET","POST"])
def signin():
    if request.method == "POST":
        usuario= User(0,None,request.form["correo"],request.form["clave"],None,None)
        usuarioAutentificado = ModelUser.signin(db,usuario)
        if usuarioAutentificado is not None:
            login_user(usuarioAutentificado)
            session["NombreU"] = usuarioAutentificado.nombre
            session["PerfilU"]= usuarioAutentificado.perfil
         
            if usuarioAutentificado.clave:   
                if usuarioAutentificado.perfil=="A":
                    return render_template("admin.html")
                else:
                    return render_template ("user.html")
            else: 
                flash("Contraseña incorrecta")
                return redirect(request.url)

        else:
            flash ("usuario inexistente")
            return redirect(request.url)
    
                 
    else:
        return render_template('signin.html')


@kickshop.route("/iUsuario",methods=["GET","POST"])
def iUsuario():
    nombre=request.form["nombre"]
    correo=request.form["correo"]
    clave=request.form["clave"]
    claveCifrada = generate_password_hash(clave)
    fechareg=datetime.now()
    perfil=request.form["perfil"]
    

    crearUsuario =db.connection.cursor()
    crearUsuario.execute("INSERT INTO usuario (nombre,correo,clave,fechareg,perfil) VALUES (%s,%s,%s,%s,%s)",(nombre,correo,claveCifrada,fechareg,perfil))
    db.connection.commit()
    flash("Usuario creado")
    return redirect("/sUsuario")

@kickshop.route("/uUsuario/<int:id>",methods=["GET","POST"])
def uUsuario(id):
    nombre=request.form["nombre"]
    correo=request.form["correo"]
    clave=request.form["clave"]
    claveCifrada = generate_password_hash(clave)
    fechareg=datetime.now()
    perfil=request.form["perfil"]
    

    editarUsuario =db.connection.cursor()
    editarUsuario.execute("UPDATE usuario SET nombre=%s,correo=%s,clave=%s,fechareg=%s,perfil=%s WHERE id=%s",(nombre,correo,claveCifrada,fechareg,perfil,id))
    db.connection.commit()
    flash("Usuario Editado")
    return redirect("/sUsuario")


@kickshop.route("/dUsuario/<int:id>",methods=["GET","POST"])
def dUsuario(id):

    eliminarUsuario =db.connection.cursor()
    eliminarUsuario.execute("DELETE FROM usuario WHERE id=%s",(id,))
    db.connection.commit()
    flash("Usuario Eliminado")
    return redirect("/sUsuario")

@kickshop.route("/signout",methods=["GET","POST"])
def signout():
    logout_user()
    return render_template("home.html")

@kickshop.route("/sProductos",methods=["GET","POST"])
def sProyecto():
    selProducto = db.connection.cursor()
    selProducto.execute("SELECT * FROM productos")
    p = selProducto.fetchall()
    selProducto.close()
    return render_template("productos.html", pyoyectos = p)    



if __name__ == '__main__':
   kickshop.config.from_object(config["development"])
   kickshop.run(port=3300) 