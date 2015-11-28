# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 19:44:33$"

from .AbstractModel import AbstractModel
from .media.media import media
class region(AbstractModel):
    width = -1
    height = -1
    top = -1
    left = -1
    medias = []
    
    # init region object model
    # width {number} : with of the region
    # height {number} : height of the region
    # top {number} : top value of the region relative to screen
    # left {number} : left value of the region relative to screen
    def __init__(self, width=None, height=None, top=None, left=None):
        self.width = width if not (width is None) else -1;
        self.height = height if not (height is None) else -1;
        self.top = top if not (top is None) else -1;
        self.left = left if not (left is None) else -1;       
        
    # add a media object to region model
    # media {media} : media object to add region object model
    def addMedia(self, media):
        self.medias.append(media);
    
    # convert object to json representation
    # with all child objects traversed
    def _toJson(self):
        regionJson = ("width:" + self.safeStr(self.width) +
                    ",height:" + self.safeStr(self.height) +
                    ",top:" + self.safeStr(self.top) +
                    ",left:" + self.safeStr(self.left));
        regionJson += self.toJsonArray("medias", self.medias);
        return regionJson;
    
    # string representation of the object model
    def __repr__(self):
        return "region";
    
    # convert object to its string representation
    # most likely to be used for log purposes
    def __str__(self):
        return ("region() : {" + 
                "\nwidth : " + self.safeStr(self.width) + 
                "\nheight : " + self.safeStr(self.height) + 
                "\ntop : " + self.safeStr(self.top) + 
                "\nleft : " + self.safeStr(self.left) + 
                "\nmedias : " + ', '.join(self.safeStr(obj) for obj in self.medias) + 
                "\n}");