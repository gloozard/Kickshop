from flask import Flask, render_template,url_for,request,redirect
from flask_mysqldb import MySQL
from werkzeug.security import generate_password_hash
from datetime import datetime 
from config import config

kickshop = Flask(__name__)
db      = MySQL(kickshop)

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



@kickshop.route("/signin")
def signin():
    return render_template('signin.html')

if __name__ == '__main__':
   kickshop.config.from_object(config["development"])
   kickshop.run(port=3300) 