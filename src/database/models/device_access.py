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
from .layout import layout

Base = declarative_base()
class device_access(Base):
        __tablename__ = 'device_access'  
        __table_args__ = {  
            'mysql_engine': 'InnoDB',  
            'mysql_charset': 'utf8'  
        }   

        device_accessid = Column(BIGINT, primary_key=True)
        device_id = Column(INTEGER, ForeignKey(device.device_id), nullable=False) #name="fk_", onupdate='CASCADE', ondelete='RESTRICT'
        device = relationship(device, backref='device')
        layout_id = Column(INTEGER, ForeignKey(layout.layoutID), nullable=False) #name="fk_", onupdate='CASCADE', ondelete='RESTRICT'
        layout = relationship(layout, backref='layout')
        deviceaccess_layoutdownloaded = Column(CHAR(1), nullable=False, default='0')
        deviceaccess_date =  Column(DATETIME, nullable=False, default=datetime.now)
        deviceaccess_hdd = Column(VARCHAR(50), nullable=False)
        deviceaccess_freehdd = Column(VARCHAR(50), nullable=False)
        deviceaccess_memory = Column(VARCHAR(50), nullable=False)
        deviceaccess_freememory = Column(VARCHAR(50), nullable=False)
        deviceaccess_lastsound = Column(INTEGER, nullable=False)
        deviceaccess_version = Column(VARCHAR(10), nullable=False)
        
        def __init__(self):
            return

        def __repr__(self):
            return "<layout(%s)>" % (self.layoutID)