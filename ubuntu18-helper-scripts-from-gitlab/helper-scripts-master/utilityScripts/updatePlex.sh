#!/bin/sh

echo deb https://downloads.plex.tv/repo/deb ./public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -

echo "This script merely adds the plex public release repo to your Debian based distros to your list of items to be updated"
echo "The script will now update the Plex media server to the latest public version"
echo "In the future, to update plex,  simply enter the following:\n sudo apt-get update"
sudo apt-get update
sudo apt-get -y upgrade
echo "Plex update is completed.  Restarting plex"
sudo service plexmediaserver restart
echo "Plex has been restarted"


