# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 20:39:01$"

import re
import settings
import base64
from Crypto.Cipher import AES

class TestUtil():            
    @staticmethod
    def reCompile(regex):
        return re.compile(regex);    