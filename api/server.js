'use strict';

const koa = require('koa');
const logger = require('koa-logger');
const compress = require('koa-compress');
const json = require('koa-json');

const app = module.exports = new koa();
app.config = require('../config.json');
app.routes = require('./app/routes');
app.controllers = require('./app/controllers');

//initialize middleware
app.use(logger());
app.use(json({pretty: false}));

//compress responses with gzip
app.use(compress({
	filter: function (contentType) {
		return /text/i.test(contentType)
	},
	threshold: 2048,
	flush: require('zlib').Z_SYNC_FLUSH
}));

//add Access-Control-Allow-Origin header
app.use(async (ctx, next) => {
	await next();
	ctx.set('Access-Control-Allow-Origin', '*');
});

//add x-response-time header
app.use(async (ctx, next) => {
	const start = new Date();
	await next();
	const ms = new Date() - start;
	ctx.set('X-Response-Time', `${ms}ms`);
});

app.routes.register(app);

//start the server
if(!module.parent) {
	app.listen(app.config.api.port);
}