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

from .deviceaccess import deviceaccess
from .layout import layout

Base = declarative_base()
class deviceaccesslayout(Base):
        __tablename__ = 'deviceaccesslayout'  
        __table_args__ = {  
            'mysql_engine': 'InnoDB',  
            'mysql_charset': 'utf8'  
        }   

        deviceaccesslayout_id = Column(INTEGER, primary_key=True)
        deviceaccess_id = Column(INTEGER, ForeignKey(deviceaccess.deviceaccess_id), nullable=False) #name="fk_", onupdate='CASCADE', ondelete='RESTRICT'
        deviceaccess = relationship(deviceaccess, backref='deviceaccess')
        layout_id = Column(INTEGER, ForeignKey(layout.layoutID), nullable=False) #name="fk_", onupdate='CASCADE', ondelete='RESTRICT'
        layout = relationship(layout, backref='layout')
        deviceaccesslayout_downloadstate = Column(CHAR(1), nullable=False, default='0')
        deviceaccesslayout_date =  Column(DATETIME, nullable=False, default=datetime.now)        
        
        def __init__(self, deviceaccess_id, layout_id, deviceaccesslayout_downloadstate, deviceaccesslayout_date):
            self.deviceaccess_id = deviceaccess_id;
            self.layout_id = layout_id;
            self.deviceaccesslayout_downloadstate = deviceaccesslayout_downloadstate;            
            self.deviceaccesslayout_date = deviceaccesslayout_date;
            return

        def __repr__(self):
            return "deviceaccesslayout";
        
        def __str__(self):
            return ("deviceaccesslayout() : {" + 
                "\n" + "deviceaccesslayout_id : " + str(self.deviceaccesslayout_id) + 
                "\n" + "deviceaccess : " + str(self.deviceaccess) + 
                "\n" + "layout : " + str(self.layout) + 
                "\n" + "deviceaccesslayout_downloadstate : " + str(self.deviceaccesslayout_downloadstate) + 
                "\n" + "deviceaccesslayout_date : " + str(self.deviceaccesslayout_date) +                 
                "\n}");