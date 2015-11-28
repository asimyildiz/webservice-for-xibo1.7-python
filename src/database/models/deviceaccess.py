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

from .device import device

Base = declarative_base()
class deviceaccess(Base):
        __tablename__ = 'deviceaccess'  
        __table_args__ = {  
            'mysql_engine': 'InnoDB',  
            'mysql_charset': 'utf8'  
        }   

        deviceaccess_id = Column(BIGINT, primary_key=True)
        device_id = Column(INTEGER, ForeignKey(device.device_id), nullable=False) #name="fk_", onupdate='CASCADE', ondelete='RESTRICT'
        device = relationship(device, backref='device')
        deviceaccess_date =  Column(DATETIME, nullable=False, default=datetime.now)
        deviceaccess_ip = Column(VARCHAR(15), nullable=False)
        deviceaccess_localip = Column(VARCHAR(15), nullable=False)        
        deviceaccess_hdd = Column(VARCHAR(50), nullable=False)
        deviceaccess_freehdd = Column(VARCHAR(50), nullable=False)
        deviceaccess_memory = Column(VARCHAR(50), nullable=False)
        deviceaccess_freememory = Column(VARCHAR(50), nullable=False)
        deviceaccess_lastsound = Column(INTEGER, nullable=False)
        deviceaccess_version = Column(VARCHAR(10), nullable=False)
        
        def __init__(self, device_id, deviceaccess_date, deviceaccess_ip, deviceaccess_localip, deviceaccess_hdd, deviceaccess_freehdd, deviceaccess_memory, deviceaccess_freememory, deviceaccess_lastsound, deviceaccess_version):                    
            self.device_id = device_id;
            self.deviceaccess_date = deviceaccess_date;
            self.deviceaccess_ip = deviceaccess_ip;            
            self.deviceaccess_localip = deviceaccess_localip;
            self.deviceaccess_hdd = deviceaccess_hdd;
            self.deviceaccess_freehdd = deviceaccess_freehdd;
            self.deviceaccess_memory = deviceaccess_memory;
            self.deviceaccess_freememory = deviceaccess_freememory;
            self.deviceaccess_lastsound = deviceaccess_lastsound;
            self.deviceaccess_version = deviceaccess_version;
            return

        def __repr__(self):
            return "deviceaccess";
        
        def __str__(self):
            return ("deviceaccess() : {" + 
                "\n" + "deviceaccess_id : " + str(self.deviceaccess_id) + 
                "\n" + "device : " + str(self.device) + 
                "\n" + "deviceaccess_date : " + str(self.deviceaccess_date) + 
                "\n" + "deviceaccess_ip : " + str(self.deviceaccess_ip) + 
                "\n" + "deviceaccess_localip : " + str(self.deviceaccess_localip) + 
                "\n" + "deviceaccess_hdd : " + str(self.deviceaccess_hdd) +
                "\n" + "deviceaccess_freehdd : " + str(self.deviceaccess_freehdd) +
                "\n" + "deviceaccess_memory : " + str(self.deviceaccess_memory) +
                "\n" + "deviceaccess_freememory : " + str(self.deviceaccess_freememory) +
                "\n" + "deviceaccess_lastsound : " + str(self.deviceaccess_lastsound) +
                "\n" + "deviceaccess_version : " + str(self.deviceaccess_version) +
                "\n}");