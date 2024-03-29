# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$18.Eki.2015 21:15:49$"

import settings
from sqlalchemy import create_engine, text
from sqlalchemy.orm import sessionmaker

from services.LogService import LogService

class DatabaseConnector():    
    """DatabaseConnector class using sqlalchemy"""    
    @classmethod
    def __startSession(self):
        LogService.logMessage("DatabaseConnector.__startSession", LogService.INFO);                    
        database_connection = '{0}://{1}:{2}@{3}/{4}?unix_socket=/var/run/mysqld/mysqld.sock'.format(settings.database_type, settings.database_user, settings.database_pass, '127.0.0.1:' + settings.database_port, settings.database_name)        
        self._engine = create_engine(database_connection, echo=settings.DATABASE_LOGGING)        
        self.__createSession()
    
    @classmethod    
    def __createSession(self): 
        LogService.logMessage("DatabaseConnector.__createSession", LogService.INFO);                    
        Session = sessionmaker(bind=self._engine)
        self._session = Session()

    @classmethod    
    def __destroySession(self):
        LogService.logMessage("DatabaseConnector.__destroySession", LogService.INFO);                    
        self._session.close();
    
    @classmethod    
    def insert(self, object): 
        LogService.logMessage("DatabaseConnector.insert", LogService.INFO);        
        try:            
            self.__startSession();
            self._session.add(object);
            self._session.commit();
            self.__destroySession();
            LogService.logMessage("DatabaseConnector.insert : insert successfull", LogService.INFO);
        except SQLAlchemyError as e:
            # log an error message here
            LogService.logMessage("DatabaseConnector.insert : insert failed exception " + e.strerror, LogService.CRITICAL);
            return
        
    @classmethod    
    def select(self, object, filters): 
        LogService.logMessage("DatabaseConnector.select", LogService.INFO);                
        try:                        
            self.__startSession();
            result = self._session.query(object);
            for qfilter in filters:
                result = result.filter(text(qfilter));                    
            self.__destroySession();
            LogService.logMessage("DatabaseConnector.select : successfull", LogService.INFO);        
            return result;
        except SQLAlchemyError as e:
            # log an error message here
            LogService.logMessage("DatabaseConnector.select : select failed exception " + e.strerror, LogService.CRITICAL);
            return None
        except:
            LogService.logMessage("DatabaseConnector.select : select failed exception ", LogService.INFO);
            return None
        
    @classmethod    
    def update(self, object): 
        LogService.logMessage("DatabaseConnector.update", LogService.INFO);           
        try:                        
            self._session.commit();
            self.__destroySession();
            LogService.logMessage("DatabaseConnector.update : successfull", LogService.INFO);        
            return True
        except SQLAlchemyError as e:
            # log an error message here
            LogService.logMessage("DatabaseConnector.update : update failed exception " + e.strerror, LogService.CRITICAL);
            return False
            
