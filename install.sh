#!/bin/bash

. cli/vars.sh

#make sure we have the correct version of node available
sudo npm install -g n
if [ $CURRENT_NODE_VERSION != $REQUIRED_NODE_VERSION ]
	then
		echo Node.js $CURRENT_NODE_VERSION detected.
		echo Downloading Node.js $REQUIRED_NODE_VERSION

		sudo n $REQUIRED_NODE_VERSION
		sudo n $CURRENT_NODE_VERSION
fi

#set up the api
sudo npm install -g supervisor
cd api
npm install
cd ..

#set up the ui
sudo npm install -g @angular/cli
cd ui
npm install
cd ..

#initialize the config
cp -n config.json.sample config.json
echo "Installation complete. Now customize config.json"