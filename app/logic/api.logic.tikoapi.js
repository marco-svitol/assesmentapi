const { stream } = require('../logger');
const logger=require('../logger'); 
const msgServerError = 'Server error';
const redisclient=require('../redis');

exports.getkey = async (req, res) => { 
	const firstname = req.body.key;
	await redisclient.getkey(`${firstname}`)
	.then((response) => {
		logger.debug(`getkey: Redis value=${response}`);
		return res.status(200).send(response);
	})
	.catch((err) => {
		logger.error(`getkey: received invalid response from Redis or Redis not ready at all while reading key ${firstname}: ${err}`);
		return res.status(503).send(`getkey: received invalid response from Redis or Redis not ready at all while reading key ${firstname}`);
	})
}

exports.setkey = async (req, res) => {
	const firstname = req.body.key;
	const lastname = req.body.value;

	await redisclient.setkey(firstname, lastname)
	.then((redisreply) => {
		logger.debug(`setkey: Redis set ${firstname} key succesfully`);
		logger.srvconsoledir(req,start=0);
		return res.status(200).send();
	})
	.catch((err) => {
		logger.error(`setkey: received invalid response from Redis or Redis not ready at all while setting key ${firstname}  : ${err}`);
		res.status(500).send(msgServerError)
	})
}
