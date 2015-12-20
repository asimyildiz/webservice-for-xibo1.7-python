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
from database.models.device import device

from services.LogService import LogService

class QueryService():
    # TODO make these queries more secure, such as do not return result if userID is none
    @classmethod
    def getAllLayouts(self, userID=None):
        LogService.logMessage("QueryService.getAllLayouts", LogService.INFO);        
        # make filtering more programmatic        
        filters = [];
        if userID != None:
            filters = ["userID = " + str(userID)];
        return DatabaseConnector.select(layout, filters).all();   
    
    @classmethod
    def getLastLayout(self, userID=None):
        LogService.logMessage("QueryService.getLastLayout", LogService.INFO);        
        # make filtering more programmatic        
        filters = [];
        if userID != None:
            filters = ["userID = " + str(userID)];
        # TODO maybe sort the results starting with the latest by ID and get first result???
        layouts = DatabaseConnector.select(layout, filters).all();
        if len(layouts) > 0:
            return layouts[-1];   
        return None;
    
    @classmethod
    def getDevice(self, deviceClientId, deviceCpuId):
        LogService.logMessage("QueryService.getDevice", LogService.INFO);        
        # make filtering more programmatic
        filters = ["device_clientid = " + deviceClientId, "device_cpuid = " + deviceCpuId];                    
        return DatabaseConnector.select(device, filters).all();   