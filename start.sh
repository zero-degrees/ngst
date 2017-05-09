#!/bin/bash

. cli/vars.sh

#start the api in the background
supervisor -w api/app,api/server.js,config.json api/server.js &

#start the ui
cd ui
ng serve --port $UI_PORT
cd ..