# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

__author__ = "asim"
__date__ = "$18.Eki.2015 21:06:42$"

import settings
if (settings.DATABASE == "MYSQL"):
    from database.mysql.DatabaseQueries import DatabaseQueries

queryManager = DatabaseQueries(settings)
layouts = queryManager.getAllLayouts()
for layout in layouts:
    print (layout.xml)
