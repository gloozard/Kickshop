class Config:
    SECRET_KEY  =   "1$!afgs%#Asd(alñad%$#lña@asd3"
    DEBUG = True
    
class DevelopmentConfig:
    MYSQL_HOST  = "localhost"
    MYSQL_USER  = "root"
    MSQL_PASSWORD   = "mysql"
    MYSQL_DB    = "kickshop"

config = {
    "development":DevelopmentConfig
    
}
