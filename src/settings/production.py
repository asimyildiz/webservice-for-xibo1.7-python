# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$18.Eki.2015 21:25:50$"

# override common configuration options here for production
from .common import *

# Production overrides
DEBUG = False
DATABASE_LOGGING = False