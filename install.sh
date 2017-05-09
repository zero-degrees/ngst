#!/bin/bash

#initialize the config
cp -n config.json.sample config.json

sudo npm install -g bower supervisor @angular/cli

#set up the api
cd api
npm install
cd ..

#set up the ui
cd ui
npm install
cd ..

echo "Installation complete. Now customize config.json"