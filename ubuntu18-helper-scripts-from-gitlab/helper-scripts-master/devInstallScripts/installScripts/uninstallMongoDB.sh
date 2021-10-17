#!/bin/sh
read -p "This script will remove all installed MongoDB packages currently existing on this system. Press Enter to continue or Ctrl+C to cancel/stop this script" i
sudo service mongod stop
sudo apt-get purge mongodb-org*
echo "All MongoDB packages have been removed. Now removing all log files"
sudo rm -rf /var/log/mongodb
sudo rm -rf /var/lib/mongodb
echo "MongoDB removal complete!"
