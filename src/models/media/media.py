# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 19:47:22$"

from models.options import options
class media():
    duration = -1
    options = None
    
    def __init__(self, duration, options):
        self.duration = duration;
        self.options = options;        