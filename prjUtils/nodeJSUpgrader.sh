#! /bin/bash

echo "Updating Node.js"

sudo npm cache clean -f
sudo npm install -g n
sudo n stable
LATEST=$(ls -t /usr/local/n/versions/node/ | head -1)
sudo ln -sf /usr/local/n/versions/node/%LATEST/bin/node /usr/bin/node

sudo n latest
