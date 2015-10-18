# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$18.Eki.2015 21:38:33$"

from datetime import datetime  
from sqlalchemy import Column, ForeignKey, create_engine  
from sqlalchemy.dialects.mysql import INTEGER, DATETIME, TEXT, TINYINT, VARCHAR  
from sqlalchemy.orm import relationship, backref
from sqlalchemy.ext.declarative import declarative_base  

from .user import user

Base = declarative_base()
class layout(Base):
        __tablename__ = 'layout'  
        __table_args__ = {  
            'mysql_engine': 'InnoDB',  
            'mysql_charset': 'utf8'  
        }   

        layoutID = Column(INTEGER, primary_key=True)
        layout = Column(VARCHAR(50), nullable=False)
        xml = Column(TEXT, nullable=False)
        userID = Column(INTEGER, ForeignKey(user.UserID), nullable=False) #name="fk_", onupdate='CASCADE', ondelete='RESTRICT'
        user = relationship(user, backref='layout')
        createdDT = Column(DATETIME, nullable=False)
        modifiedDT = Column(DATETIME, nullable=False)
        description = Column(VARCHAR(254), nullable=True)
        tags = Column(VARCHAR(254), nullable=True)
        retired = Column(TINYINT(4), nullable=False, default=0)
        duration = Column(INTEGER, nullable=False, default=0)
        backgroundImageId = Column(INTEGER, nullable=True)
        status = Column(TINYINT(4), nullable=False, default=0)
        
        
        def __init__(self):
            return

        def __repr__(self):
            return "<layout(%s)>" % (self.layoutID)