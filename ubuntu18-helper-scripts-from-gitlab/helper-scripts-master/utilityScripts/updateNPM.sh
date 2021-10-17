#!/bin/bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo npm cache clean -f
sudo npm i -g npm
sudo chown -R 1000:1000 "/home/devlab/.npm" #fix for npm bug in previous version
sudo npm install -g n
sudo n latest
echo "NPM successfully updated";