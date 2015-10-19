# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 19:40:24$"

from .region import region
from .transitions.transition import transition
class screen():
    width = -1
    height = -1
    bgcolor = ""
    background = ""
    regions = []
    transitions = []
    
    def __init__(self, width=None, height=None, bgcolor=None, background=None):        
        self.width = width if not (width is None) else -1;
        self.height = height if not (height is None) else -1;
        self.bgcolor = bgcolor if not (bgcolor is None) else -1;
        self.background = background if not (background is None) else -1;        
    
    def addRegion(self, region):
        self.regions.append(region);

    def addTransition(self, transition):
        self.transitions.append(transition);
        
    def __str__(self):
        return ("screen() : {" + 
                "\nwidth : " + str(self.width) + 
                "\nheight : " + str(self.height) + 
                "\nbgcolor : " + self.bgcolor + 
                "\nbackground : " + self.background + 
                "\n}");