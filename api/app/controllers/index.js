module.exports.indexAction = async (ctx, next) => {
	ctx.body = {};

	await next;
};