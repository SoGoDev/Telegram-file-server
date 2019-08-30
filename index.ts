import config from "./config.json"

process.env.__TELEGRAM_HASH__ = config.app_hash;
process.env.__TELEGRAM_ID__ = config.app_id;
process.env.__TELEGRAM_NUMBER__ = config.phone_number;

import './app'
