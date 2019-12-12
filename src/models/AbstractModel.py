# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 20:33:37$"

from services.LogService import LogService
class AbstractModel():    
    dontPutQuote = True
    
    # convert object to json representation    
    def toJson(self):        
        LogService.logMessage("AbstractModel.toJson", LogService.INFO);        
        return ("{\"" + self.__repr__() + "\":{" +
                    self._toJson() + 
                "}}");                
    
    # convert child object to json representation
    # this SHALL be overriden by child class
    def _toJson(self):
        LogService.logMessage("AbstractModel._toJson", LogService.ERROR);        
        raise Exception('_toJson method shall be overriden!')        
    
    # convert an array of objects to json representation    
    def toJsonArray(self, repr, array):
        LogService.logMessage("AbstractXmlToJsonService.toJsonArray", LogService.INFO);
        reprJson = "," + self.safeStr(repr) + ": [";
    
        # parse all array elements
        for element in array:
            if hasattr(element, 'toJson'):
                reprJson += element.toJson() + ",";
            else:
                reprJson += self.safeStr(element) + ",";
    
        # if element is found and endswith a ',' comma, remove the comma
        elementFound = len(array)
        if elementFound > 0 and reprJson.endswith(','):
            reprJson = reprJson[:-1];
        
        # close array brackets and return
        reprJson += "]"
        return reprJson
    
    # safely convert a primitive type to string
    def safeStr(self, val):            
        strval = str(val);
        strval = strval.replace("\n", "");
        strval = strval.replace("\"", "'");
        if (not strval):
            return "\"\"";
        else:
            if hasattr(val, 'dontPutQuote') or not isinstance(val, str):
                return strval.replace("{", "").replace("}", "");
            else :
                return "\"" + strval + "\"";                
    
    # class name
    def __repr__(self):
        return "AbstractModel";
        