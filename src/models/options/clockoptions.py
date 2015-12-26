# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 19:56:03$"

from .options import options
from models.static.clocktypes import clocktypes
from models.static.clockthemes import clockthemes
class clockoptions(options):
    theme = -1
    clockTypeId = -1
    offset = 0
    # init clockoptions object model
    # uri {string} : uri of the rtmp or hls stream to play
    def __init__(self, theme, clockTypeId, offset):
        self.theme = theme;
        self.clockTypeId = clockTypeId;
        self.offset = offset;
        
    # convert object to json representation
    # with all child objects traversed
    # this should be called from child class 
    def _toJson(self):        
        return (self.safeStr("theme") + ":" + self.safeStr(self.theme).replace("'", "\"") + 
            "," + self.safeStr("clockType") + ":" + self.safeStr(self.clockTypeId).replace("'", "\"") + 
            "," + self.safeStr("offset") + ":" + self.safeStr(self.offset).replace("'", "\""));
    
    # string representation of the object model
    def __repr__(self):
        return "clockoptions";
    
        # convert object to its string representation
    # most likely to be used for log purposes    
    def __str__(self):
        return ("clockoptions() : {" + 
                "\ntheme : " + self.safeStr(self.theme) + 
                "\nclocktype : " + self.safeStr(self.clockTypeId) + 
                "\noffset : " + self.safeStr(self.offset) +
                "\n}");