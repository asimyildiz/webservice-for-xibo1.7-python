# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 20:03:23$"

import settings
from .media import media
from models.options.imageoptions import imageoptions

class imagemedia(media):        
    # init textmedia object model
    # duration {number} : duration of the media
    # imageoptions {imageoptions} : image options object of the media        
    def __init__(self, duration, imageoptions):        
        super(imagemedia,self).__init__(duration, imageoptions)        
    
    # convert object to json representation
    # with all base objects added    
    def _toJson(self):        
        return super(imagemedia,self)._toJson();                  
        
    # string representation of the object model
    def __repr__(self):
        return "imagemedia";
    
    # convert object to its string representation
    # most likely to be used for log purposes
    def __str__(self):
        return ("imagemedia() : {" + 
                "\nduration : " + self.safeStr(self.duration) + 
                "\nimageoptions : " + self.safeStr(self.options) +                             
                "\n}");    