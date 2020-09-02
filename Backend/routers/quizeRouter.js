const router = require('express').Router();
const quizeController = require('./../controllers/quizeController');

router.route('/').get(quizeController.getAllQuize);

module.exports = router;
