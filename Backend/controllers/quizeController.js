const Quize = require('../models/quizeModel');

exports.getAllQuize = async (req, res, next) => {
	try {
		const data = await Quize.find();

		res.status(200).json({
			status: 'success',
			length: data.length,
			data
		});
	} catch (err) {
		res.status(400).json({
			status: 'failed',
			data: err.message
		});
	}
};
