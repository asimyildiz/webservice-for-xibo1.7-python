# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 20:03:23$"

import settings
from .media import media
from models.options.clockoptions import clockoptions

class clockmedia(media):   
    format=""
    # init textmedia object model
    # duration {number} : duration of the media
    # videooptions {videooptions} : video options object of the media        
    def __init__(self, duration, clockoptions, format=None):        
        super(clockmedia,self).__init__(duration, clockoptions)        
        if (format == None):
            self.format = settings.DEFAULT_CLOCK_FORMAT;
    
    # convert object to json representation
    # with all base objects added    
    def _toJson(self):        
        mediaJson = super(clockmedia,self)._toJson();
        mediaJson += "," + self.safeStr("format") + ":" + self.safeStr(self.format);
        return mediaJson;
        
    # string representation of the object model
    def __repr__(self):
        return "clockmedia";
    
    # convert object to its string representation
    # most likely to be used for log purposes
    def __str__(self):
        return ("clockmedia() : {" + 
                "\nduration : " + self.safeStr(self.duration) + 
                "\nclockoptions : " + self.safeStr(self.options) + 
                "\nformat : " + self.safeStr(self.format) +
                "\n}");     