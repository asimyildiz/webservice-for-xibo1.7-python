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
        device_lastaccess =  Column(DATETIME, nullable=False, default=datetime.now)
        device_ip = Column(VARCHAR(15), nullable=False)
        device_localip = Column(VARCHAR(15), nullable=False)
        device_activationdate =  Column(DATETIME, nullable=False)
        device_deactivationdate =  Column(DATETIME, nullable=False)        
        
        def __init__(self):
            return

        def __repr__(self):
            return "<layout(%s)>" % (self.layoutID)