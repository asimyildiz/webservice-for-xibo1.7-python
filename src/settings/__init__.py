# this class holds config informations
# because it stores sensitive information it is best that this class is not put into repository
__author__ = "asim"
__date__ = "$18.Eki.2015 21:25:31$"

from .development import *  # put .production if use production environment

if (DEBUG):
    if (DATABASE == "MYSQL"):
        database_type = "mysql"
        database_host = "localhost"
        database_user = "xibo"
        database_pass = "Xibo2015#"
        database_name = "xibo"
        database_port = "3306"
else:
    if (DATABASE == "MYSQL"):
        # put production values here
        database_type = "mysql"
        database_host = "localhost"
        database_user = "xibo"
        database_pass = "Xibo2015#"
        database_name = "xibo"
        database_port = "3306"