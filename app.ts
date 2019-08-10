const fs = require('fs');
const os = require('os');
const { Airgram, Auth, prompt } = require('airgram');
const { UPDATE } = require('@airgram/api');
const config = require('./config.json');
//const TelegramFileManager = require('./telegram_file_manager');

const pass = {
    apiId: Number(config.app_id),
    apiHash: config.app_hash,
    logVerbosityLevel: 2,
    useTestDc: false,
    useChatInfoDatabase: false,
    useMessageDatabase: false,
    applicationVersion: "1.0a",
    command: `./td/build/${config.CPP_LIB[os.type()]}`
};

const airgram = new Airgram(pass);

const auth = new Auth(airgram, pass);

//const TFM = new TelegramFileManager({
//    file_types_handle: config.file_types_handle,
//    uploaded: config.uploaded,
//    for_upload: config.for_upload,
//    upload_done: config.upload_done,
//    to_channel_id: config.to_channel_id
//});
//
//auth.use({
//    code: () => prompt(`Please enter the secret code:\n`),
//    phoneNumber: async () => {
//        console.log("in")
//        config.phone_number
//    },
//});
//
//auth.ready().then(() => {
//    console.log("Telegram test server started");
//    TFM.setClient(airgram);
//}).catch((err)=> console.log(err));
//
//airgram.on(UPDATE.updateFile, ({ update }, next) => {
//    TFM.onFileUpload(update.file);
//    next()
//});
//
//airgram.updates.on(UPDATE.updateNewMessage, ({ update }, next) => {
//    TFM.downloadFile(update.message.content);
//
//    return next
//});
//
//process.on('exit', ()=>{
//    airgram.destroy();
//});
