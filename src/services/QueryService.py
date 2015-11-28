# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$03.Kas.2015 16:13:47$"

import settings
from datetime import datetime  
from database.DatabaseConnector import DatabaseConnector
from database.models.layout import layout
from database.models.user import user

from services.LogService import LogService

class QueryService():
    @classmethod
    def getAllLayouts(self):
        LogService.logMessage("QueryService.getAllLayouts", LogService.INFO);        
        # make filtering more programmatic
        #filters = ["logger_clientid = '" + str(clientId) + "'", "logger_logtype = " + str(logType)];            
        filters = [];
        return DatabaseConnector.select(layout, filters).all();        