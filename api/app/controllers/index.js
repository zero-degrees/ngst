const AbstractController = require('./abstractController');

class IndexController extends AbstractController {
	async indexAction(ctx, next) {
		ctx.body = {};

		await next;
	}
}

module.exports = IndexController;