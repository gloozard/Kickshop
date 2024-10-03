from werkzeug.security import check_password_hash
from flask_login import UserMixin

class User(UserMixin):
    def __init__(self,id,nombre,correo,fechareg,perfil):
        self.id = id
        self.nombre = nombre
        self.correo = correo
        self.fechareg = fechareg
        self.perfil = perfil
    
    @classmethod
    
    def ValidarClave(self,claveCifrada,clave):
        return check_password_hash(claveCifrada,clave)
        
        
        
    