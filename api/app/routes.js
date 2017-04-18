const route = require('koa-route');

const routes = module.exports;

routes.register = (app) => {
	app.use(route.get('/', app.controllers.index.indexAction));
};