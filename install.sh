#!/bin/bash

. cli/vars.sh

sudo npm install -g bower n supervisor @angular/cli

#make sure we have the correct version of node available
if [ $CURRENT_NODE_VERSION != $REQUIRED_NODE_VERSION ]
	then
		echo Node.js $CURRENT_NODE_VERSION detected.
		echo Downloading Node.js $REQUIRED_NODE_VERSION

		sudo n $REQUIRED_NODE_VERSION
		sudo n $CURRENT_NODE_VERSION
fi

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