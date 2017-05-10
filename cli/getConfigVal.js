'use strict';

var config = require('../config.json');

var val = config;
var path, key, i;

try {
	if(process.argv.length >= 2) {
		path = process.argv[2].split(".");
		for(i = 0; i < path.length; ++i) {
			key = path[i];
			if(val.hasOwnProperty(key)) {
				val = val[key];
			}
			else {
				throw "Invalid path.";
			}
		}

		if(typeof val == "string") {
			val = '"' + val.replace(/"/g, '\\"') + '"';
		}
		process.stdout.write(val.toString());
	}
	else {
		throw "Missing path.";
	}
}
catch(error) {
	console.error(error);
}