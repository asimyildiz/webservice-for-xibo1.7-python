# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 20:33:37$"

import xml.etree.ElementTree
import settings
from models.screen import screen
from models.region import region
from models.options.textoptions import textoptions
from models.static.mediatypes import mediatypes
class XmlToJsonService():
    __parser = xml.etree.ElementTree
    __tree = object()
    __screen = screen()
    
    def __init__(self, xml):
        self.__tree = self.__parser.fromstring(xml);                
    
    def __parseScreen(self, attributes):
        self.__screen.width = int(attributes.get("width"));
        self.__screen.height = int(attributes.get("height"));
        self.__screen.bgcolor = attributes.get("bgcolor");
        self.__screen.background = attributes.get("background");
        #print (self.__screen)
    
    def __parseRegions(self, regions):
        for region in regions:
            self.__parseRegion(region);
    
    def __parseRegion(self, regionxml):
        # parse region attributes
        attributes = regionxml.attrib;
        newregion = region(float(attributes.get("width")), float(attributes.get("height")), 
                        float(attributes.get("top")), float(attributes.get("left")));
        #print (newregion);
        self.__parseMedias(regionxml.iter("media"), newregion);
        self.__screen.addRegion(newregion);
    
    def __parseMedias(self, medias, newregion):
        for media in medias:
            self.__parseMedia(media, newregion);
    
    def __parseMedia(self, mediaxml, newregion):        
        if (mediaxml.get("type") == mediatypes.TEXT):
            self.__parseOptions(mediaxml.iter("options"), textoptions)            
        #print (attributes);
    
    def __parseOptions(self, optionsxml, options):
        alloptions = []
        for optionxml in list(optionsxml):                        
            alloptions.append(options(dict([(option.tag, option.text) for option in optionxml])));
        
        for option in alloptions:
            print(option)
            
                
        #print(dict((child.tag, child.attrib) for child in list(optionsxml)))
        #newoptions = options(list(optionsxml));
        #print (newoptions)
    
    def toJson(self):
        self.__parseScreen(self.__tree.attrib);
        self.__parseRegions(self.__tree.iter('region'));        
        
