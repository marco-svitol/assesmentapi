const createClient = require('redis').createClient;
const logger=require('../logger');
let client = null;

(async () => {
    client = createClient({
        url: `redis://${global.config_data.global.redis_url}:${global.config_data.global.redis_port}`
    });
  
    client.on(
        'error', (err) => {
            logger.error(`redis: error connecting to redis://${global.config_data.global.redis_url}:${global.config_data.global.redis_port}`, err);
            process.exit(1);
        }
        
    );
  
    await client.connect();
    logger.info ( `redis: service connected to redis://${global.config_data.global.redis_url}:${global.config_data.global.redis_port}`)

})();

module.exports.setkey = async function(key, value){
    await client.set(key, value);
}

module.exports.getkey = async function(key){
    let r = await client.get(key);
    return r;
}
