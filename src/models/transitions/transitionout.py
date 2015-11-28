# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 20:29:48$"

from .transition import transition
class transitionout(transition):
    # init transitionout object model
    # duration {number} : duration of the transition
    # direction {string} : direction of the transition    
    # because python does not call automatically the super constructor, call it here
    def __init__(self, duration, direction):
        super(transitionout, self).__init__(duration, direction)
        
    # string representation of the object model
    def __repr__(self):
        return "transitionout";