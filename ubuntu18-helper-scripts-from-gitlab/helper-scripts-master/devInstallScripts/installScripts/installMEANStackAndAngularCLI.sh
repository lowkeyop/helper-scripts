#!/bin/sh
read -p "Installing Node.js NPM and Git on this system. (Note: Installing the LTS versions) Press Enter to continue" i
sudo apt install nodejs npm git
read -p "Installing Angular CLI.  Very useful tool for creating new Angular Projects. Press Enter to continue" i2
sudo npm install -g @angular/cli

