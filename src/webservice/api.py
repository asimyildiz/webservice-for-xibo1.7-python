#general import folders
import os, sys, re
lib_path = os.path.abspath(os.path.join('..'))
sys.path.append(lib_path)

import settings
from datetime import datetime
from services.QueryService import QueryService

from jsonrpc import dispatcher
from services.XmlToJsonService import XmlToJsonService

from services.LogService import LogService

@dispatcher.add_method
def getAllLayouts(**kwargs):
    LogService.logMessage("api.getAllLayouts", LogService.INFO);    
    layouts = QueryService.getAllLayouts();    
    for layout in layouts: 
        LogService.logMessage("api.getAllLayouts : layout " + layout.xml, LogService.INFO);
        xmltojson = XmlToJsonService(layout.xml);    
        xmltojson.toJson();    