const fs = require('fs');
const config = require('./config.json');

if (!fs.existsSync(`.${config.folder}`)) {
    fs.mkdirSync(`.${config.folder}`)
}

require('./app');
