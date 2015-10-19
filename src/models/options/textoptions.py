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
    
    def __init__(self,  params):               
        self.direction = params.get("direction");
        self.scrollSpeed = params.get("scrollSpeed");
        self.fitText = params.get("fitText");    
        
    def __str__(self):
        return ("textoptions() : {" + 
                "\ndirection : " + self.direction + 
                "\nscrollSpeed : " + str(self.scrollSpeed) + 
                "\nfitText : " + str(self.fitText) +
                "\n}");