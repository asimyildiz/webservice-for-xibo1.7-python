# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Ara.2015 23:11:46$"

import uuid
import settings
from util.Util import Util
if __name__ == "__main__":
    print ("test_crypt\n");
    #message is CLIENT_ID + # + CPU_ID
    clientID = "1";
    cpuID = uuid.uuid4().hex;
    
    separator = settings.SEPARATOR * (48 - (len(clientID) + len(cpuID)));
    message = clientID + separator + cpuID;
    print ("MESSAGE : \n" + message);

    encoded = Util.encrypt(message);
    print ("ENCODED : \n" + str(encoded));

    decoded = Util.decrypt(encoded)        
    print ("DECODED : \n" + str(decoded));
