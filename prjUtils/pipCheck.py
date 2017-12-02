#!/usr/bin/env python
import imp
import sys
import argeparse

try:
	imp.find_module('pipfdsaf')
	found = True
except ImportError:
	found = False

print "was pip found: " + str(found)

argList = sys.argv
modName = argList[-1] # last parameter is 
print "number of arguments: " , len(argList) , "arguments.\n",str(argList), "Last element: " , sys.argv[-1]
