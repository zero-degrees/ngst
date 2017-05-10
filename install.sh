#!/bin/bash

#initialize the config
cp -n config.json.sample config.json

#install global dependencies
sudo npm i -g bower supervisor @angular/cli

#set up the api
cd api
npm i
cd ..

#set up the ui
if [ -d "ui" ]
	then
		#ensure that all of the ui's latest dependencies are installed
		cd ui
		npm i
		cd ..
	else
		#initialize the ui
		ng new ui --directory=ui --skip-git=true --style=scss

		#join the hard tab master race
		cd ui
		find . -type f \( -name "*.html" -o -name "*.js" -o -name "*.ts" -o -name "*.scss" -o -name "*.json" \) ! -path "./node_modules/*" -exec sed -i 's/  /\t/g' {} +

		#add node modules
		npm i --save @angular/material @angular/animations hammerjs
		npm i --save-dev @types/hammerjs
		cd ..

		#install our customized files
		cp -R -f .ui-mods/* ui
fi

echo -e "\033[0;32mInstallation complete. Now customize \033[0;31mconfig.json\033[0m"