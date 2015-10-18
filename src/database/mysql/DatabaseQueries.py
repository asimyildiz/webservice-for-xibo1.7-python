# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$18.Eki.2015 22:15:54$"

from database.DatabaseConnector import DatabaseConnector
from .models.layout import layout
class DatabaseQueries:
    def __init__(self, settings):
        self._connection = DatabaseConnector(settings)
        
    def getAllLayouts(self):
        query = self._connection._session.query(layout)
        return query.all()