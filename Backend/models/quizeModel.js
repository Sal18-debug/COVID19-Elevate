const mongoose = require('mongoose');

const quizeSchema = new mongoose.Schema({
	question: String,
	ans: String,
	options: [String]
});

const Quize = mongoose.model('Quize', quizeSchema);

module.exports = Quize;
