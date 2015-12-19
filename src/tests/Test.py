# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 20:39:01$"

import unittest
import settings
from tests.TestUtil import TestUtil
from util.Util import Util
from services.QueryService import QueryService
from services.ScreenXmlToJsonService import ScreenXmlToJsonService

class Test(unittest.TestCase):    
    def test_xmltojson(self):
        print ("test_xmltojson\n");
        layouts = QueryService.getAllLayouts();
        for layout in layouts:            
            xmltojson = ScreenXmlToJsonService(layout.xml, layout.layoutID);                
            xmltojson.parse();
            jsonval = xmltojson.screenToJson();
            print ("JSONVALUE : \n" + jsonval);
            self.assertRegex(jsonval, TestUtil.reCompile('(^screen|width|height|bgcolor|background|regions|transitions|{|})'), "JSON VALUE VALID");      

    def test_xmltojsonzip(self):
        print ("test_xmltojson\n");
        layouts = QueryService.getAllLayouts();
        for layout in layouts:            
            xmltojson = ScreenXmlToJsonService(layout.xml, layout.layoutID);                
            xmltojson.parse();
            jsonval = xmltojson.toJson();
            print ("JSONVALUE : \n" + jsonval);
            self.assertRegex(jsonval, TestUtil.reCompile('(^layoutID|layoutURL|{|})'), "JSON VALUE VALID");      

    def test_crypt(self):
        print ("test_crypt\n");
        #message is CLIENT_ID + # + CPU_ID
        clientID = "1111";
        cpuID = "52EFD2D148F17AF3AC967EE8F4E736D7";
        separator = settings.SEPARATOR * (48 - (len(clientID) + len(cpuID)));
        message = clientID + separator + cpuID;
        print ("MESSAGE : \n" + message);
        
        encoded = Util.encrypt(message);
        print ("ENCODED : \n" + str(encoded));
        
        decoded = Util.decrypt(encoded)        
        print ("DECODED : \n" + str(decoded));
        
        self.assertEqual(message, decoded, "MESSAGE SUCCESSFULLY DECRYPTED");
        
        valuesAfterDecrypt = Util.parseDecodedMessage(decoded);
        self.assertEqual(clientID, valuesAfterDecrypt[0], "CLIENT ID MUST EQUAL AFTER DECRYPT");
        self.assertEqual(cpuID, valuesAfterDecrypt[1], "CPU ID MUST EQUAL AFTER DECRYPT");
      
if __name__ == '__main__':
    unittest.main()
