# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 19:56:44$"

from models.AbstractModel import AbstractModel
class options(AbstractModel):
    def __init__(self):
        return
    
    # convert object to json representation
    # with all child objects traversed
    # this should be called from child class 
    def _toJson(self):        
        return "";
    
    # convert object to its string representation
    # most likely to be used for log purposes
    def __str__(self):
        return "";