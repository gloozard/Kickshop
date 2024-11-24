class Config:
    SECRET_KEY  =   "1$!afgs%#Asd(alñad%$#lña@asd3"
    DEBUG = True
    
class DevelopmentConfig(Config):
    """MYSQL_HOST  = "localhost"
    MYSQL_USER  = "root"
    MSQL_PASSWORD   = "mysql"
    MYSQL_DB    = "kickshop"""
    #PITON EN TODOS LADOS 
    
    MYSQL_HOST  = "kickshop.mysql.pythonanywhere-services.com"
    MYSQL_USER  = "root"
    MSQL_PASSWORD   = "kick1508"
    MYSQL_DB    = "kickshop$kickshop"
class MailConfig(Config):
    MAIL_SERVER         = "smtp.gmail.com"
    MAIL_PORT = 587
    MAIL_USE_TLS = True
    MAIL_USE_sSL = False
    MAIL_USERNAME = "emiliano1846@alumnos.udg.mx"
    MAIL_PASSWORD = "CONTRASEÑA DE GOOGLE"
    MAIL_DEFAULT_SENDER = "emiliano1846@alumnos.udg.mx"
    MAIL_ASCII_ATTACHMENTS = True
    
config = {
    "development":DevelopmentConfig,
    "mail" : MailConfig
}
