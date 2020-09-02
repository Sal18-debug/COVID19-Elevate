const User = require('../models/userModel');

exports.getAllUser = async (req, res, next) => {
  try {
    const data = await User.find();

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

exports.signup = async (req, res, next) => {
  try {
    // Check Guard
    if (!req.body) {
      return next(new Error('Data is mandatory the body!'));
    }

    const data = await User.create(req.body);

    res.status(201).json({
      status: 'success',
      data
    });
  } catch (err) {
    res.status(400).json({
      status: 'failed',
      data: err.message
    });
  }
};

exports.login = async (req, res, next) => {
  try {
    const data = await User.findOne({ email: req.body.email, password: req.body.password });

    // Check Guard
    if (!data) {
      throw new Error('Their is no data with this email');
    }

    res.status(200).json({
      status: 'success',
      data: data
    });
  } catch (err) {
    res.status(400).json({
      status: 'failed',
      data: err.message
    });
  }
};
