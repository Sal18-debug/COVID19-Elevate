// Global Import
const cors = require('cors');
const xss = require('xss-clean');
const morgan = require('morgan');
const helmet = require('helmet');
const express = require('express');
const compression = require('compression');
const mongoSanitize = require('express-mongo-sanitize');

//Import Routes
const admin = require('./routers/adminRouter');

const app = express();

app.enable('trust proxy');

//Middleware
//Implement cors
app.use(cors());
app.options('*', cors());

// Serving static files
app.use(express.static(path.join(__dirname, 'public')));

//set security HTTPS headers
app.use(helmet());

//Body parsser, reading  data from body into req.body
app.use(express.json({ limit: '1024kb' }));
app.use(express.urlencoded({ extended: true, limit: '1024kb' }));

// Data sanitization against NoSql query injection
app.use(mongoSanitize());

// Data sanitization against XSS
app.use(xss());

// Compress the Output
app.use(compression());

// Logging Middleware
app.use(morgan('dev'));

// ROUTES
app.use('/api/v1/admin', adminRouter);
//app.use('/api/v1/quize', quizeRouter);

//Handling unexpected routes
app.all('*', (req, res, next) => {
	res.status(500).json({
		status: 'failed',
		message: `Can't find ${req.originalUrl} on this server`
	});
});

module.exports = app;
