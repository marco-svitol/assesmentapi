// requires
const _ = require('lodash');

// module variables
const config = require('./config/config.json');
const defaultConfig = config.development;
const environment = process.env.NODE_ENV || 'development';
const environmentConfig = config[environment];
const finalConfig = _.merge(defaultConfig, environmentConfig);

module.exports.config = finalConfig;

// module.exports.loadconfig = function(req, res, next) {
// 	const logger = require('../logger');
// }