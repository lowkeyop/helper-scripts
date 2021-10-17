#!/bin/sh

read -p "Press Enter to continue" i1
echo "Importing the public key for MongoDB v4.0"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "Creating the mognodb-org-4.0 file in '/etc/apt/sources.list.d' directory"
read -p "Press Enter to continue and update all packages before installing MongoDB v4.0"
echo "Installing MongoDB v4.0"
sudo apt-get install mongodb-org -y
echo "MongoDB v4 installation complete. In the future, be sure the start the MongoDB service with the following command:
sudo service mongod start
This script will start it once you've pressed Enter"
sudo service mongod start
echo "Verify that MongoDB was started successfully. check 
/var/log/mongodb/mongod.log
This script will take you there to see that the service is waiting for connections on port 27017"
 
