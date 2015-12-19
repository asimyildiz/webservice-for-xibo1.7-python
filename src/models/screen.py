# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 19:40:24$"

from .AbstractModel import AbstractModel
from .region import region
from .transitions.transition import transition
class screen(AbstractModel):
    width = -1
    height = -1
    bgcolor = ""
    background = ""
    regions = []
    transitions = []
    
    # init screen object model
    # width {number} : with of the screen
    # height {number} : height of the screen
    # bgcolor {string} : background color value of the screen
    # background {string} : background image name of the screen if exists
    def __init__(self, width=None, height=None, bgcolor=None, background=None):        
        self.width = width if not (width is None) else -1;
        self.height = height if not (height is None) else -1;
        self.bgcolor = bgcolor if not (bgcolor is None) else "";
        self.background = background if not (background is None) else "";
        self.regions = [];
        self.transitions = [];
    
    # add a region object to screen model
    # region {region} : region object to add screen object model
    def addRegion(self, region):
        self.regions.append(region);

    # add a transition object to screen model
    # transition {transition} transition object to add screen object model
    def addTransition(self, transition):
        self.transitions.append(transition);
        
    # convert object to json representation
    # with all child objects traversed
    def _toJson(self):
        screenJson = (self.safeStr("width") + ":" + self.safeStr(self.width) +
                    "," + self.safeStr("height") + ":" + self.safeStr(self.height) +
                    "," + self.safeStr("bgcolor") + ":" + self.safeStr(self.bgcolor) + 
                    "," + self.safeStr("background") + ":" + self.safeStr(self.background));
        screenJson += self.toJsonArray("regions", self.regions);
        screenJson += self.toJsonArray("transitions", self.transitions);
        
        return screenJson;
        
    # string representation of the object model
    def __repr__(self):
        return "screen";
        
    # convert object to its string representation
    # most likely to be used for log purposes
    def __str__(self):
        return ("screen() : {" + 
                "\nwidth : " + self.safeStr(self.width) + 
                "\nheight : " + self.safeStr(self.height) + 
                "\nbgcolor : " + self.safeStr(self.bgcolor) + 
                "\nbackground : " + self.safeStr(self.background) + 
                "\nregions : " + ', '.join(self.safeStr(obj) for obj in self.regions) + 
                "\ntransitions : " + ', '.join(self.safeStr(obj) for obj in self.transitions) + 
                "\n}");    