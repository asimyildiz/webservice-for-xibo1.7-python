# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 19:47:22$"

from models.AbstractModel import AbstractModel
from models.options import options
class media(AbstractModel):
    duration = -1
    options = None
    
    # init base media object model
    # duration {number} : duration of the media
    # options {options} : options object of the media
    def __init__(self, duration, options):
        self.duration = duration;
        self.options = options;   
      
    # convert object to json representation
    # with all child objects traversed
    # this should be called from child class 
    def _toJson(self):        
        return ("duration:" + self.safeStr(self.duration) +
                ",options:" + self.safeStr(self.options));
    
    # string representation of the object model
    def __repr__(self):
        return "media";
    
    # convert object to its string representation
    # most likely to be used for log purposes
    def __str__(self):
        return ("media() : {" + 
                "\nduration : " + self.safeStr(self.duration) + 
                "\noptions : " + self.safeStr(self.options) +
                "\n}");