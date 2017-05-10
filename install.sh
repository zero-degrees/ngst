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
		#initialize the ui
		ng new ui --directory=ui --skip-git=true --style=scss

		#join the hard tab master race
		cd ui
		find . -type f -name "*.html" -name "*.js" -name "*.ts" -name "*.scss" -name "*.json" -not -path "./node_modules/*" -exec sed -i 's/  /\t/g' {} +

		#add node modules
		npm install --save @angular/material @angular/animations hammerjs
		cd ..

		#install our customized files
		cp -R -f .ui-mods/* ui
fi

echo -e "\033[0;32mInstallation complete. Now customize \033[0;31mconfig.json\033[0m"