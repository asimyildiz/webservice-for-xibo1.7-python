# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$19.Eki.2015 20:29:48$"

from .transition import transition
class transitionout(transition):
    def __init__(self, duration, direction):
        super(transitionout, self).__init__(duration, direction)