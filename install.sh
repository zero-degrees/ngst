#!/bin/bash

. cli/vars.sh

sudo npm install -g bower supervisor @angular/cli

#set up the api
cd api
npm install
cd ..

#set up the ui
cd ui
npm install
cd ..

#initialize the config
cp -n config.json.sample config.json
echo "Installation complete. Now customize config.json"