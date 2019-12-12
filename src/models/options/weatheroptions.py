# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 19:56:03$"

from .options import options
class weatheroptions(options):
    name = ""
    useDisplayLocation = -1    
    color = ""    
    longitude = -1
    latitude = -1
    templateId = ""
    icons = ""
    overrideTemplate = -1
    size = -1
    units = ""
    lang = ""
    updateInterval = -1
    dayConditionsOnly = -1
    
    # init weatheroptions object model
    # name {string} : city name property of #text 
    # useDisplayLocation {number} : 
    # color {string} : background color of weather app #text
    # longitude {number} : longitude of the city
    # latitude {number} : latitude of the city 
    # templateId {string} 
    # icons {string}
    # overrideTemplate {number}
    # size {number}
    # units {string}
    # lang {string}
    # updateInterval {number}
    # dayConditionsOnly {number}
    def __init__(self,  name, useDisplayLocation, color, longitude, latitude, templateId, icons, overrideTemplate, size, units, lang, updateInterval, dayConditionsOnly):               
        self.name = name;
        self.useDisplayLocation = useDisplayLocation;
        self.color = color;
        self.longitude = longitude;
        self.latitude = latitude;
        self.templateId = templateId;
        self.icons = icons;
        self.overrideTemplate = overrideTemplate;
        self.size = size;
        self.units = units;
        self.lang = lang;
        self.updateInterval = updateInterval;
        self.dayConditionsOnly = dayConditionsOnly
        
    # convert object to json representation
    # with all child objects traversed
    # this should be called from child class 
    def _toJson(self):        
        return (self.safeStr("name") + ":" + self.safeStr(self.name).replace("'", "\"") + 
            "," + self.safeStr("useDisplayLocation") + ":" + self.safeStr(self.useDisplayLocation).replace("'", "\"") + 
            "," + self.safeStr("color") + ":" + self.safeStr(self.color).replace("'", "\"") + 
            "," + self.safeStr("longitude") + ":" + self.safeStr(self.longitude).replace("'", "\"") + 
            "," + self.safeStr("latitude") + ":" + self.safeStr(self.latitude).replace("'", "\"") + 
            "," + self.safeStr("templateId") + ":" + self.safeStr(self.templateId).replace("'", "\"") + 
            "," + self.safeStr("icons") + ":" + self.safeStr(self.icons).replace("'", "\"") + 
            "," + self.safeStr("overrideTemplate") + ":" + self.safeStr(self.overrideTemplate).replace("'", "\"") + 
            "," + self.safeStr("size") + ":" + self.safeStr(self.size).replace("'", "\"") + 
            "," + self.safeStr("units") + ":" + self.safeStr(self.units).replace("'", "\"") + 
            "," + self.safeStr("lang") + ":" + self.safeStr(self.lang).replace("'", "\"") + 
            "," + self.safeStr("updateInterval") + ":" + self.safeStr(self.updateInterval).replace("'", "\"") + 
            "," + self.safeStr("dayConditionsOnly") + ":" + self.safeStr(self.dayConditionsOnly).replace("'", "\""));
    
    # string representation of the object model
    def __repr__(self):
        return "weatheroptions";
    
    # convert object to its string representation
    # most likely to be used for log purposes    
    def __str__(self):
        return ("weatheroptions() : {" + 
                "\nname : " + self.safeStr(self.name) + 
                "\nuseDisplayLocation : " + self.safeStr(self.useDisplayLocation) + 
                "\ncolor : " + self.safeStr(self.color) + 
                "\nlongitude : " + self.safeStr(self.longitude) + 
                "\nlatitude : " + self.safeStr(self.latitude) +
                "\ntemplateId : " + self.safeStr(self.templateId) +
                "\nicons : " + self.safeStr(self.icons) +
                "\noverrideTemplate : " + self.safeStr(self.overrideTemplate) +
                "\nsize : " + self.safeStr(self.size) +
                "\nunits : " + self.safeStr(self.units) +
                "\nlang : " + self.safeStr(self.lang) +
                "\nupdateInterval : " + self.safeStr(self.updateInterval) +
                "\ndayConditionsOnly : " + self.safeStr(self.dayConditionsOnly) +
                "\n}");