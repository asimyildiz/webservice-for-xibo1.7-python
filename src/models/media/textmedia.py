# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 20:03:23$"

import settings
from .media import media
from models.options.textoptions import textoptions
class textmedia(media):
    fontSize = -1
    fontColor = ""
    fontFamily = []
    fontStyles = []
        
    def __init__(self, fontSize=None, fontColor=None, fontFamily=None, duration, textoptions):        
        super(textmedia,self).__init__(duration, textoptions)
        if (fontSize == None):
            self.fontSize = settings.DEFAULT_FONT_SIZE;
        if (fontColor == None):
            self.fontColor = settings.DEFAULT_FONT_COLOR;
        if (fontFamily == None):
            self.fontFamily = settings.DEFAULT_FONT_FAMILY;        
    
    def addFontStyle(self, fontStyle):
        self.fontStyles.append(fontStyle);
    