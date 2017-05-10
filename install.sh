#!/bin/bash

#initialize the config
cp -n config.json.sample config.json

#install global dependencies
sudo npm install -g bower supervisor @angular/cli

#set up the api
cd api
npm install
cd ..

#set up the ui
if [ -d "ui" ]
	then
		#ensure that all of the ui's latest dependencies are installed
		cd ui
		npm install
		cd ..
	else
		#create the ui directory
		ng new ui --directory=ui --skip-git=true --style=scss
fi

echo -e "\033[0;32mInstallation complete. Now customize \033[0;31mconfig.json\033[0m"