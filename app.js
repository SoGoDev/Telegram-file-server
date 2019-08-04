const fs = require('fs');
const os = require('os');
const { Airgram, Auth, prompt } = require('airgram');
const { UPDATE } = require('airgram-api');
const config = require('./config.json');
const TelegramFileManager = require('./telegram_file_manager');

const airgram = new Airgram({
    apiId: Number(config.app_id),
    apiHash: config.app_hash,
    logVerbosityLevel: 2,
    useTestDc: false,
    useChatInfoDatabase: true,
    useMessageDatabase: true,
    applicationVersion: "1.0a",
    command: `./td/build/${config.CPP_LIB[os.type()]}`
});

const auth = new Auth(airgram);

const TFM = new TelegramFileManager({
    file_types_handle: config.file_types_handle,
    uploaded: config.uploaded,
    for_upload: config.for_upload,
    upload_done: config.upload_done,
    to_channel_id: config.to_channel_id
});

function checkIfFoldersExists() {
    [config.uploaded, config.for_upload, config.upload_done].forEach(folder => {
        if (folder !== "") {
            //            if (!fs.existsSync(folder)) fs.mkdirSync(folder)
        }
    })
}

let state = [];

auth.use({
    code: () => prompt(`Please enter the secret code:\n`),
    phoneNumber: config.phone_number,
});

auth.ready(() => {
    console.log("Telegram test server started");
    TFM.setClient(airgram);
    airgram.api.getChats({ limit: 10000 })
});

airgram.on(UPDATE.updateFile, ({ update }, next) => {
    TFM.onFileUpload(update.file);
    next()
});

airgram.updates.on(UPDATE.updateNewMessage, ({ update }, next) => {
    TFM.downloadFile(update.message.content);

    return next
});
