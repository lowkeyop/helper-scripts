#!/bin/bash

#Updating Operating System to latest version through CLI

echo "Updating to latest version of Ubuntu"
echo "Hello, updating and upgrading all packages before Retro Pie install"
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get dist-upgrade
sudo do-release-upgrade -d