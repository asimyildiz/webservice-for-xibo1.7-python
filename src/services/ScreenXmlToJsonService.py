# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 20:33:37$"

import settings
from services.LogService import LogService
from .AbstractXmlToJsonService import AbstractXmlToJsonService
from models.screen import screen
from models.region import region
from models.options.textoptions import textoptions
from models.static.mediatypes import mediatypes

class ScreenXmlToJsonService(AbstractXmlToJsonService):        
    __screen = screen()
    
    # init screenxmltojsonservice object
    # because python does not call automatically the base contructor
    def __init__(self, xml):        
        super(ScreenXmlToJsonService,self).__init__(xml)
        
    # @override
    # parse xml to object
    def parse(self):
        LogService.logMessage("ScreenXmlToJsonService.parse", LogService.INFO);        
        self.__parseScreen(self._tree.attrib);
        self.__parseRegions(self._tree.iter('region'));
        
    # @override
    # convert object to json representation
    def toJson(self):
        LogService.logMessage("ScreenXmlToJsonService.toJson", LogService.INFO);        
        print (self.__screen.toJson());
    
    # parse screen from xml
    # attributes {dict} : attributes dictionary
    def __parseScreen(self, attributes):
        self.__screen.width = int(attributes.get("width"));
        self.__screen.height = int(attributes.get("height"));
        self.__screen.bgcolor = attributes.get("bgcolor");
        self.__screen.background = attributes.get("background");
        #print (self.__screen)
    
    # parse regions from xml
    # regions {array|dict} : regions array of dictionary
    def __parseRegions(self, regions):
        for region in regions:
            self.__parseRegion(region);
    
    # parse region from xml
    # region {dict} : region dictionary
    def __parseRegion(self, regionxml):
        # parse region attributes
        attributes = regionxml.attrib;
        newregion = region(float(attributes.get("width")), float(attributes.get("height")), 
                        float(attributes.get("top")), float(attributes.get("left")));
        #print (newregion);
        self.__parseMedias(regionxml.iter("media"), newregion);
        self.__screen.addRegion(newregion);
    
    # parse medias from xml
    # medias {array|dict} : media array of dictionary
    def __parseMedias(self, medias, newregion):
        for media in medias:
            self.__parseMedia(media, newregion);
    
    # parse media from xml
    # mediaxml {string} xml
    def __parseMedia(self, mediaxml, newregion):        
        if (mediaxml.get("type") == mediatypes.TEXT):
            self.__parseOptions(mediaxml.iter("options"), textoptions)            
        #print (attributes);
    
    # parse options from xml
    # optionsxml {string} xml
    def __parseOptions(self, optionsxml, options):
        alloptions = []
        for optionxml in list(optionsxml):                        
            alloptions.append(options(dict([(option.tag, option.text) for option in optionxml])));
        return alloptions;