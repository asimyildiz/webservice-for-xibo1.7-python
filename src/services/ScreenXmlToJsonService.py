# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 20:33:37$"

import settings
import zipfile
import os
from .AbstractXmlToJsonService import AbstractXmlToJsonService
from services.LogService import LogService
from models.screen import screen
from models.region import region
from models.options.textoptions import textoptions
from models.options.videooptions import videooptions
from models.options.imageoptions import imageoptions
from models.media.textmedia import textmedia
from models.media.livemedia import livemedia
from models.media.imagemedia import imagemedia
from models.static.mediatypes import mediatypes

class ScreenXmlToJsonService(AbstractXmlToJsonService):        
    __screen = None;
    __assets = None;
    
    # init screenxmltojsonservice object
    # because python does not call automatically the base contructor
    def __init__(self, xml, layoutID):        
        super(ScreenXmlToJsonService,self).__init__(xml, layoutID)
        self.__assets = [];
        
    # @override
    # parse xml to object
    def parse(self):
        LogService.logMessage("ScreenXmlToJsonService.parse", LogService.INFO);        
        self.__parseScreen(self._tree.attrib);
        self.__parseRegions(self._tree.iter('region'));
        self.__saveAssets(settings.XIBO_ASSET_PATH, settings.ZIP_SAVE_PATH);        
        
    # @override
    # convert object to json representation
    def toJson(self):
        LogService.logMessage("ScreenXmlToJsonService.toJson", LogService.INFO);        
        return "{\"layoutID\": " + str(self._layoutID) + ",\"layoutURL\": \"" + settings.WEBSERVER_ASSET_IP + str(self._layoutID) + "/layout.zip\"}";        
        
    # parse screen from xml
    # attributes {dict} : attributes dictionary
    def __parseScreen(self, attributes):
        self.__screen = screen(int(attributes.get("width")), int(attributes.get("height")), attributes.get("bgcolor"), attributes.get("background"));        
    
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
        attributes = mediaxml.attrib;
        duration = attributes.get("duration");
        #if (mediaxml.get("type") == mediatypes.TEXT):
        #    self.__parseOptions(mediaxml.iter("options"), textoptions)            
        if (mediaxml.get("type") == mediatypes.LIVE):
            media = livemedia(duration, self.__parseOptions(mediaxml.iter("options"), videooptions, False)[0])            
            newregion.addMedia(media);            
        elif (mediaxml.get("type") == mediatypes.IMG):
            media = imagemedia(duration, self.__parseOptions(mediaxml.iter("options"), imageoptions, True)[0])
            newregion.addMedia(media);
        #print (attributes);
    
    # parse options from xml
    # optionsxml {string} xml
    def __parseOptions(self, optionsxml, options, externalAsset):
        alloptions = []
        for optionxml in list(optionsxml):
            alloptions.append(options(dict([(option.tag, option.text) for option in optionxml])));
            if externalAsset:
                for option in optionxml:
                    self.__assets.append(option.text)
        return alloptions;
    
    # convert object to json representation
    # TODO MAKE THIS METHOD PRIVATE WHEN ON PRODUCTION OK!!!
    def screenToJson(self):
        LogService.logMessage("ScreenXmlToJsonService.__screenToJson", LogService.INFO);        
        return self.__screen.toJson();
    
    # save assets needed into a zip file into the folder
    # folder {string} path of the folder to put the zip file
    # zipSaveFolder {string} path of the folder to save the zip file
    def __saveAssets(self, folder, zipSaveFolder):
        directory = zipSaveFolder + str(self._layoutID) + "\\";
        if not os.path.exists(directory):
            os.makedirs(directory);
        
        layout = zipfile.ZipFile(directory + "layout.zip", "w");
        for asset in self.__assets:
            layout.write(folder + asset, arcname=asset, compress_type=zipfile.ZIP_DEFLATED)
        
        # save layout json into this file too
        jsonFilePath = directory + "layout.json";
        file = open(jsonFilePath, 'w');
        # TODO CALL PRIVATE METHOD HERE ON PRODUCTION
        file.write(self.screenToJson());
        file.close();
        
        # add also json file to zip
        layout.write(jsonFilePath, arcname="layout.json", compress_type=zipfile.ZIP_DEFLATED);
                
        # close and remove json file        
        os.remove(jsonFilePath);
        layout.close();
        