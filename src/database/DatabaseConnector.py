# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$18.Eki.2015 21:15:49$"

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
class DatabaseConnector:
    """DatabaseConnector class using sqlalchemy"""    
    def __init__(self, settings):
        database_connection = '{0}://{1}:{2}@{3}/{4}'.format(settings.database_type, settings.database_user, settings.database_pass, ':' + settings.database_port, settings.database_name)        
        self._engine = create_engine(database_connection, echo=settings.DATABASE_LOGGING)
        self.createSession()
        
    def createSession(self): 
        Session = sessionmaker(bind=self._engine)
        self._session = Session()