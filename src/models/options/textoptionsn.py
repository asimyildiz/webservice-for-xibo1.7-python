# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 19:56:03$"

from .options import options
class textoptionsn(options):
    # convert object to json representation
    # with all child objects traversed
    # this should be called from child class 
    def _toJson(self):        
        return "";
    
    # string representation of the object model
    def __repr__(self):
        return "textoptions";
    
    # convert object to its string representation
    # most likely to be used for log purposes    
    def __str__(self):
        return ("");