# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 19:44:33$"

from .media.media import media
class region():
    width = -1
    height = -1
    top = -1
    left = -1
    medias = []
    
    def __init__(self, width=None, height=None, top=None, left=None):
        self.width = width if not (width is None) else -1;
        self.height = height if not (height is None) else -1;
        self.top = top if not (top is None) else -1;
        self.left = left if not (left is None) else -1;       
        
    def addMedia(self, media):
        self.medias.append(media);
        
    def __str__(self):
        return ("region() : {" + 
                "\nwidth : " + str(self.width) + 
                "\nheight : " + str(self.height) + 
                "\ntop : " + str(self.top) + 
                "\nleft : " + str(self.left) + 
                "\n}");