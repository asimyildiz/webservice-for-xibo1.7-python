# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$03.Kas.2015 16:18:39$"

import logging
class LogService(object):    
    DEBUG = "debug"
    WARNING = "warning"
    ERROR = "error"
    CRITICAL = "critical"
    INFO = "info"
    
    @staticmethod
    def logMessage(message, logType):
        logging.basicConfig(filename='DigitalSignage.log',level=logging.INFO)
        if logType == LogService.DEBUG:
            logging.debug(message);
        elif logType == LogService.WARNING:
            logging.warning(message);
        elif logType == LogService.ERROR:
            logging.error(message);
        elif logType == LogService.CRITICAL:
            logging.critical(message);
        else :
            logging.info(message);
        