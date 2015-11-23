# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$03.Kas.2015 16:18:39$"

import logging
class LogService(object):    
    @staticmethod
    def logMessage(message, logType):
        logging.basicConfig(filename='DigitalSignage.log',level=logging.DEBUG)
        if logType == "debug":
            logging.debug(message);
        elif logType == "warning":
            logging.warning(message);
        elif logType == "error":
            logging.error(message);
        elif logType == "critical":
            logging.critical(message);
        else :
            logging.info(message);
        