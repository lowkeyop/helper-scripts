#!/bin/bash
PROJ_LOC=$1
cd $PROJ_LOC

sudo npm install --save bootstrap
echo "Don't forget to add \"../node_modules/bootstrap/dist/css/bootstrap.min.css\", to your  .angular-cli.json file in the styles array"
