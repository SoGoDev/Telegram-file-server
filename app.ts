import {Airgram, Auth, prompt} from 'airgram';
import {UPDATE} from '@airgram/api';
import * as os from 'os';
import config from "./config.json"
import TelegramFileManager from './telegram_file_manager';

// @ts-ignore
const pass = {
  apiId: Number(process.env.__TELEGRAM_ID__),
  apiHash: process.env.__TELEGRAM_HASH__,
  logVerbosityLevel: 2,
  command: `./td/build/${config.CPP_LIB[os.type()]}`
};

const airgram = new Airgram(pass);

const auth = new Auth(airgram);

const TFM = new TelegramFileManager({
   file_types_handle: config.file_types_handle,
   uploaded: config.uploaded,
   for_upload: config.for_upload,
   upload_done: config.upload_done,
   to_channel_id: config.to_channel_id
});
console.log(process.env.__TELEGRAM_NUMBER__)
auth.use({
  code: () => prompt(`Please enter the secret code:\n`),
  // @ts-ignore
  phoneNumber: () => process.env.__TELEGRAM_NUMBER__
  ,
});

auth.ready().then(() => {
  console.log("Telegram test server started");
  TFM.setClient(airgram);
}).catch((err) => console.log(err));

airgram.on(UPDATE.updateFile, ({update}, next) => {
  TFM.onFileUpload(update.file);
  next()
});

airgram.updates.on(UPDATE.updateNewMessage, ({update}, next) => {
  TFM.downloadFile(update.message.content);

  return next
});
