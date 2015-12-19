#general import folders
import os, sys, re
lib_path = os.path.abspath(os.path.join('..'))
sys.path.append(lib_path)

import settings
from datetime import datetime
from jsonrpc import dispatcher
from util.Util import Util
from services.LogService import LogService
from services.QueryService import QueryService
from services.ScreenXmlToJsonService import ScreenXmlToJsonService

################################################################################
##########################DISPATCHER METHODS####################################
################################################################################
@dispatcher.add_method
def getAllLayouts(**kwargs):
    LogService.logMessage("api.getAllLayouts", LogService.INFO);    
    layouts = QueryService.getAllLayouts();    
    for layout in layouts: 
        #LogService.logMessage("api.getAllLayouts : layout " + layout.xml, LogService.INFO);
        xmltojson = ScreenXmlToJsonService(layout.xml);    
        xmltojson.parse();
        jsonval = xmltojson.toJson();
        
@dispatcher.add_method
def getLatestLayout(**kwargs):
    LogService.logMessage("api.getLatestLayout", LogService.INFO);    
    keyCode = kwargs.get('keyCode');
    keyPass = kwargs.get('keyPass');
    deviceIdentifier = kwargs.get('deviceIdentifier');
    userID = kwargs.get('userID');
    
    layoutResponse = "{\"layouts\":[";
    layouts = QueryService.getLastLayout(userID);
    for layout in layouts: 
        #LogService.logMessage("api.getLatestLayout : layout " + layout.xml, LogService.INFO);
        xmltojson = ScreenXmlToJsonService(layout.xml, layout.layoutID);    
        xmltojson.parse();
        layoutResponse += xmltojson.toJson() + ",";
    
    if len(layouts) > 0 and layoutResponse.endswith(','):
        layoutResponse = layoutResponse[:-1];
        
    return layoutResponse += "]}";
        
@dispatcher.add_method
def validateBox(**kwargs):
    LogService.logMessage("api.validateBox", LogService.INFO);     
    keyCode = kwargs.get('keyCode');
    keyPass = kwargs.get('keyPass');
    deviceIdentifier = kwargs.get('deviceIdentifier');        
    return __isValidKey(keyCode, keyPass) and __isValidBox(deviceIdentifier);        

################################################################################
############################PRIVATE METHODS#####################################
################################################################################
def __isValidKey(keyCode, keyPass):
    return True if keyCode == settings.KEY_CODE and keyPass == settings.KEY_PASS else False;       

def __isValidBox(deviceIdentifier):
    try:
        LogService.logMessage("api.__isValidBox : deviceIdentifier {0}".format(deviceIdentifier), LogService.INFO);        
        decodedMessage = Util.decrypt(deviceIdentifier);
        LogService.logMessage("api.__isValidBox : decodedMessage {0}".format(decodedMessage), LogService.INFO);        
        deviceInformation = Util.parseDecodedMessage(decodedMessage);
        LogService.logMessage("api.__isValidBox : device information parsed {0} {1}".format(deviceInformation[0], deviceInformation[1]), LogService.INFO);        
        devices = QueryService.getDevice(deviceInformation[0], deviceInformation[1]);
        if len(devices) > 0:
            device = devices[0];
            LogService.logMessage("api.__isValidBox : device found {0}".format(device.device_id), LogService.INFO);        
            if (datetime.now() - datetime.strptime(device.device_deactivationdate, "%d/%m/%Y %H:%M:%S")).total_seconds() > 0:
                LogService.logMessage("api.__isValidBox : device deactivated {0}".format(device.device_id), LogService.INFO);        
                return False;            
            LogService.logMessage("api.__isValidBox : device active {0}".format(device.device_id), LogService.INFO);        
            return True;
        else :
            LogService.logMessage("api.__isValidBox : device not found", LogService.INFO);        
            return False;        
    except Error as e:
        LogService.logMessage("api.__isValidBox : {0} {1}".format(e.errno, e.strerror));
        return False;