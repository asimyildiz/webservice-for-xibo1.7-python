# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 19:56:03$"

from .options import options
class textoptions(options):
    direction = ""
    scrollSpeed = -1
    fitText = -1
    
    # init textoptions object model
    # direction {string} : direction property of text 
    # scrollSpeed {number} : scroll speed property of text
    # fitText {number} : fit text property of text
    def __init__(self,  direction, scrollSpeed, fitText):               
        self.direction = direction;
        self.scrollSpeed = scrollSpeed;
        self.fitText = fitText;
        
    # convert object to json representation
    # with all child objects traversed
    # this should be called from child class 
    def _toJson(self):        
        return ("direction:" + self.safeStr(self.direction) +
                ",scrollSpeed:" + self.safeStr(self.direction) +
                ",fitText:" + self.safeStr(self.fitText));
    
    # string representation of the object model
    def __repr__(self):
        return "textoptions";
    
    # convert object to its string representation
    # most likely to be used for log purposes    
    def __str__(self):
        return ("textoptions() : {" + 
                "\ndirection : " + self.safeStr(self.direction) + 
                "\nscrollSpeed : " + self.safeStr(self.scrollSpeed) + 
                "\nfitText : " + self.safeStr(self.fitText) +
                "\n}");