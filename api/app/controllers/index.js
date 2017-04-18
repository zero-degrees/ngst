const controller = module.exports;

controller.indexAction = async (ctx, next) => {
	ctx.body = {};

	await next;
}