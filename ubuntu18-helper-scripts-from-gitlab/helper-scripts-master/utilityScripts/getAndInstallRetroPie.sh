#!/bin/bash

echo "Hello, updating and upgrading all packages before Retro Pie install"
sudo apt-get update && sudo apt-get upgrade -y
echo "Update and upgrade complete. Installing packages:\n\tgit\n\tdialog\n\tunzip\n\tand\n\txmlstarlet\n\tif don't exist"
sudo apt-get install -y git dialog unzip xmlstarlet

echo "grabbing a copy of Retro Pie install"
git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git

echo "Installing Retro Pie. A UI will show up. Select the installation type of your choice when prompted (Basic is suggested)..."
sleep 5
cd RetroPie-Setup
sudo ./retropie_setup.sh



