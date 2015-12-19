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
        
    # init textmedia object model
    # duration {number} : duration of the media
    # textoptions {textoptions} : text options object of the media    
    # fontSize {number} : font size of current text media object
    # fontColor {string} : font color of current text media object
    # fontFamily {array|string} : font family names of current text media object (helvetica, arial)
    # fontStyles {array|string} : font styles of current text media object (bold,underline)
    def __init__(self, duration, textoptions, fontSize=None, fontColor=None, fontFamily=None, fontStyles=None):        
        super(textmedia,self).__init__(duration, textoptions)
        if (fontSize == None):
            self.fontSize = settings.DEFAULT_FONT_SIZE;
        if (fontColor == None):
            self.fontColor = settings.DEFAULT_FONT_COLOR;
        if (fontFamily == None):
            self.fontFamily = settings.DEFAULT_FONT_FAMILY;        
        if (fontStyles == None):
            self.fontStyles = settings.DEFAULT_FONT_STYLES;
    
    # add a font family to current textmedia object model
    # fontFamily {string} : font family name to add to textmedia object model
    def addFontFamily(self, fontFamily):
        self.fontFamily.append(fontFamily);    
    
    # add a font style to current textmedia object model
    # fontStyle {string} : font style name to add to textmedia object model
    def addFontStyle(self, fontStyle):
        self.fontStyles.append(fontStyle);
        
    # convert object to json representation
    # with all base objects added    
    def _toJson(self):        
        mediaJson = super(textmedia,self)._toJson();
        mediaJson += ("," + self.safeStr("fontSize") + ":" + self.safeStr(self.fontSize) +
                    "," + self.safeStr("fontColor") + ":" + self.safeStr(self.fontColor));
        mediaJson += self.toJsonArray("fontFamily", self.fontFamily);
        mediaJson += self.toJsonArray("fontStyles", self.fontStyles);
        
        return mediaJson;
        
    # string representation of the object model
    def __repr__(self):
        return "textmedia";
    
    # convert object to its string representation
    # most likely to be used for log purposes
    def __str__(self):
        return ("textmedia() : {" + 
                "\nduration : " + self.safeStr(self.duration) + 
                "\ntextoptions : " + self.safeStr(self.options) + 
                "\nfontSize : " + self.safeStr(self.fontSize) + 
                "\nfontColor : " + self.safeStr(self.fontColor) +
                "\nfontFamily : " + ', '.join(self.safeStr(obj) for obj in self.fontFamily) + 
                "\nfontStyles : " + ', '.join(self.safeStr(obj) for obj in self.fontStyles) + 
                "\n}");    