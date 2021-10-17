#!/bin/sh
#this script is just to enable toggling backlighting 
#of my keyboard in Ubuntu.  Functionality not available 
#by default.  You may want to create a process to start 
#this script on default if desired.
sudo xmodmap -e 'add mod3 = Scroll_Lock'
