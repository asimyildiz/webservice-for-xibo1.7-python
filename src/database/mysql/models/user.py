# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$18.Eki.2015 21:38:33$"

from datetime import datetime  
from sqlalchemy import Column, ForeignKey, create_engine  
from sqlalchemy.dialects.mysql import INTEGER, DATETIME, TEXT, TINYINT, VARCHAR  
from sqlalchemy.ext.declarative import declarative_base  

Base = declarative_base()
class user(Base):
        __tablename__ = 'user'  
        __table_args__ = {  
            'mysql_engine': 'InnoDB',  
            'mysql_charset': 'utf8'  
        }   

        UserID = Column(INTEGER, primary_key=True)
        usertypeid = Column(INTEGER(8), nullable=False)
        UserName = Column(VARCHAR(50), nullable=False)
        UserPassword = Column(VARCHAR(128), nullable=False)
        loggedin = Column(TINYINT(1), nullable=False, default=0)
        lastaccessed = Column(DATETIME, nullable=True)
        email = Column(VARCHAR(50), nullable=True)
        homepage = Column(VARCHAR(254), nullable=False, default="dashboard.php")
        Retired = Column(TINYINT(4), nullable=False, default=0)
        CSPRNG = Column(TINYINT(4), nullable=False, default=0)
        newUserWizard = Column(TINYINT(4), nullable=False, default=0)
        
        
        def __init__(self):
            return

        def __repr__(self):
            return "<user(%s)>" % (self.UserID)