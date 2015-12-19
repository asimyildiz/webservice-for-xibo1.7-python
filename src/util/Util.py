# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 20:39:01$"

import re
import settings
import base64
from Crypto.Cipher import AES

class Util():    
    cipher = AES.new(settings.UNIQUE_KEY);
    
    @staticmethod
    def reCompile(regex):
        return re.compile(regex);
    
    @staticmethod
    def encrypt(message):        
        return base64.b64encode(Util.cipher.encrypt(message)).decode('UTF8');
    
    @staticmethod
    def decrypt(encodedMessage):        
        return Util.cipher.decrypt(base64.b64decode(encodedMessage)).decode('UTF8');
    
    @staticmethod
    def parseDecodedMessage(message):
        numberOfSeparators = message.count(settings.SEPARATOR)
        separator = settings.SEPARATOR * numberOfSeparators
        return re.split(separator, message, 1);    