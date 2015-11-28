# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 20:28:32$"

from models.AbstractModel import AbstractModel
class transition(AbstractModel):
    duration = -1
    direction = ""
    
    # init transition object model
    # duration {number} : duration of the transition
    # direction {string} : direction of the transition    
    def __init__(self, duration, direction):
        self.duration = duration;
        self.direction = direction;  
        
    # convert object to json representation
    # with all child objects traversed
    # this should be called from child class 
    def _toJson(self):        
        return ("duration:" + self.safeStr(self.duration) +
                ",direction:" + self.safeStr(self.direction));
    
    # string representation of the object model
    def __repr__(self):
        return "transition";
    
    # convert object to its string representation
    # most likely to be used for log purposes
    def __str__(self):
        return ("transition() : {" + 
                "\nduration : " + self.safeStr(self.duration) + 
                "\ndirection : " + self.safeStr(self.direction) +
                "\n}");