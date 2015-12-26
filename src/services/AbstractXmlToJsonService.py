# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 20:33:37$"

import xml.etree.ElementTree
import settings
from services.LogService import LogService

class AbstractXmlToJsonService():    
    _tree = None;  
    _layoutID = None;
    _lastModifiedDate = None;
    
    def __init__(self, xmlstr, layoutID, lastModifiedDate):
        LogService.logMessage("AbstractXmlToJsonService.__init__", LogService.INFO);        
        self._tree = xml.etree.ElementTree.fromstring(xmlstr);          
        self._layoutID = layoutID;
        self._lastModifiedDate = lastModifiedDate;
    
    def parse(self):
        LogService.logMessage("AbstractXmlToJsonService.parse", LogService.ERROR);        
        raise NotImplementedError('parse method shall be overriden!');        
    
    def toJson(self):
        LogService.logMessage("AbstractXmlToJsonService.toJson", LogService.ERROR);
        raise NotImplementedError('toJson method shall be overriden!');
        