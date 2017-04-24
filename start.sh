#!/bin/bash

. cli/vars.sh

#switch to the required node version
if [ $CURRENT_NODE_VERSION != $REQUIRED_NODE_VERSION ]
	then
		sudo n $REQUIRED_NODE_VERSION
fi

#start the api in the background
supervisor -w api/app,api/server.js,config.json api/server.js &

#start the ui
cd ui
ng serve --port $UI_PORT
cd ..

#reset to the original node version
if [ $CURRENT_NODE_VERSION != $REQUIRED_NODE_VERSION ]
	then
		sudo n $CURRENT_NODE_VERSION
fi