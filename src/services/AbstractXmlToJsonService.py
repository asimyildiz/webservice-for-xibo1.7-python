# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 20:33:37$"

import xml.etree.ElementTree
import settings
from services.LogService import LogService

class AbstractXmlToJsonService():    
    _tree = object()    
    
    def __init__(self, xmlstr):
        LogService.logMessage("AbstractXmlToJsonService.__init__", LogService.INFO);        
        self._tree = xml.etree.ElementTree.fromstring(xmlstr);        
    
    def parse(self):
        LogService.logMessage("AbstractXmlToJsonService.parse", LogService.ERROR);        
        raise Exception('parse method shall be overriden!')        
    
    def toJson(self):
        LogService.logMessage("AbstractXmlToJsonService.toJson", LogService.ERROR);
        raise Exception('toJson method shall be overriden!')
        