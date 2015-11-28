# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$18.Eki.2015 21:38:33$"

from datetime import datetime  
from sqlalchemy import Column, ForeignKey, create_engine  
from sqlalchemy.dialects.mysql import BIGINT, INTEGER, DATETIME, TEXT, TINYINT, VARCHAR  
from sqlalchemy.orm import relationship, backref
from sqlalchemy.ext.declarative import declarative_base  

Base = declarative_base()
class device(Base):
        __tablename__ = 'device'  
        __table_args__ = {  
            'mysql_engine': 'InnoDB',  
            'mysql_charset': 'utf8'  
        }   

        device_id = Column(BIGINT, primary_key=True)
        device_securecode = Column(VARCHAR(255), nullable=False)
        device_clientid = Column(INTEGER, nullable=False)
        device_name = Column(VARCHAR(255), nullable=False)
        device_detail = Column(TEXT, nullable=True)
        device_cpuid = Column(VARCHAR(50), nullable=False)
        device_activationdate =  Column(DATETIME, nullable=False)
        device_deactivationdate =  Column(DATETIME, nullable=False)        
        
        def __init__(self, device_securecode, device_clientid, device_name, device_detail, device_cpuid, device_activationdate, device_deactivationdate):
            self.device_securecode = device_securecode;
            self.device_clientid = device_clientid;
            self.device_name = device_name;            
            self.device_detail = device_detail;
            self.device_cpuid = device_cpuid;
            self.device_activationdate = device_activationdate;
            self.device_deactivationdate = device_deactivationdate;
            return

        def __repr__(self):
            return "device";
        
        def __str__(self):
            return ("device() : {" + 
                "\n" + "device_id : " + str(self.device_id) + 
                "\n" + "device_securecode : " + str(self.device_securecode) + 
                "\n" + "device_clientid : " + str(self.device_clientid) + 
                "\n" + "device_name : " + str(self.device_name) + 
                "\n" + "device_detail : " + str(self.device_detail) +
                "\n" + "device_cpuid : " + str(self.device_cpuid) +
                "\n" + "device_activationdate : " + str(self.device_activationdate) +
                "\n" + "device_deactivationdate : " + str(self.device_deactivationdate) +
                "\n}");