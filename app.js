const fs = require('fs');
const os = require('os');
const { Airgram, Auth, prompt } = require('airgram');
const { UPDATE } = require('airgram-api');
const config = require('./config.json');

const airgram = new Airgram({
    apiId: Number(config.app_id),
    apiHash: config.app_hash,
    logVerbosityLevel: 0,
    useTestDc: false,
    useChatInfoDatabase: true,
    useMessageDatabase: true,
    applicationVersion: "1.0a",
    command: `./td/build/${config.CPP_LIB[os.type()]}`
});

const auth = new Auth(airgram);

function checkIfWatchFoldersIsEmpry() {
    config.watches_folders.forEach(folder => {
        const result = fs.readdirSync(folder);
        if (result.length) result.forEach((filename) => {
            uploadNewFileToTelegram(`${folder}/${filename}`)
        })
    })
}

let state = [];

auth.use({
    code: () => prompt(`Please enter the secret code:\n`),
    phoneNumber: config.phone_number,
});

auth.ready(() => {
    console.log("Telegram test server started");
    checkIfWatchFoldersIsEmpry();
    fileWatcher();
    airgram.api.getChats({ limit: 10000 })
});

airgram.on(UPDATE.updateFile, ({ update }, next) => {
    if (update.file.remote.isUploadingActive && state.find(a => a === update.file.id)) {
        if(update.file.remote.uploadedSize){
            const fileSplitedPath = update.file.local.path.split('/');
            console.log(`Downloading File ${fileSplitedPath[fileSplitedPath.length-1]}, uploaded size ${update.file.remote.uploadedSize}`);

        }else{
            console.log(`Sending File ${fileSplitedPath[fileSplitedPath.length-1]} from telegram cloud, size ${update.file.local.downloadedSize}`);
        }
    }
    if (!update.file.local.isDownloadingActive && state.find(a => a === update.file.id)) {
        state = state.filter(e => e !== update.file.id);
        sendFile(update.file)
    }

    next()
});

airgram.updates.on(UPDATE.updateNewMessage, ({ update }, next) => {
    if (config.file_types_handle.documents && update.message.content.document) {
        downloadFile(update.message.content.document.document)
    } else if (config.file_types_handle.video && update.message.content.video) {
        downloadFile(update.message.content.video.video)
    } else if (config.file_types_handle.photo && update.message.content.photo) {
        const photo = update.message.content.photo.sizes;
        downloadFile(photo[photo.length - 1].photo)
    }

    return next
});

function downloadFile({ id }) {
    const fileName = id;
    airgram.api.downloadFile({
        fileId: fileName,
        priority: 32,
        synchronous: true
    }).then(data => {
        const a = fs.createReadStream(data.local.path);
        const filePath = data.local.path.split('/');
        //file name and format as array
        const c = filePath[filePath.length - 1].split(".");
        const name = c.slice(0, -1);
        const format = c[c.length - 1];
        const b = fs.createWriteStream(`.${config.folder}/${name}_${new Date().getTime()}.${format}`, { flag: 'w' });
        a.pipe(b);

        if (fs.existsSync(data.local.path) && config.watches_folders.includes(data.local.path)) a.pipe(() => fs.unlinkSync(
            data.local.path));
    }).catch((a) => console.log(a))
}

//file watcher

function fileWatcher() {
    config.watches_folders.forEach(element => {
        if (!fs.existsSync(element)) return console.log(`folder ${element} does not exists`);

        fs.watch(element, (eventType, filename) => {

            if (eventType === 'rename' && fs.existsSync(element + "/" + filename)) {
                uploadNewFileToTelegram(element + "/" + filename)
            }

        })
    });

}

function uploadNewFileToTelegram(path) {
    airgram.api.uploadFile({
        file: {
            _: 'inputFileLocal',
            path: path,
        },
        fileType: {
            _: 'fileTypeDocument'
        },
        priority: 32
    }).then((e) => {

        const fileSplitedPath = e.local.path.split('/');
        if(e.remote.uploadedSize){
            console.log(`Downloading File ${fileSplitedPath[fileSplitedPath.length-1]}, uploaded size ${e.remote.uploadedSize}`);

        }else{
            console.log(`Sending File ${fileSplitedPath[fileSplitedPath.length-1]} from telegram cloud, size ${e.local.downloadedSize}`);
        }

        if (e.remote.id) {
            return sendFile(e, false)
        }
        state.push(e.id);
    })
}

function sendFile(e, isLocal = true) {
    const fileContext = {
        _: 'inputFileId',
        id: e.id
    };

    if (!isLocal) {
        fileContext._ = 'inputFileRemote';
        fileContext.id = e.remote.id
    }

    airgram.api.sendMessage({
        chatId: +config.to_channel_id,
        replyToMessageId: 0,
        disableNotification: false,
        fromBackground: true,
        inputMessageContent: {
            _: 'inputMessageDocument',
            document: fileContext
        }
    })
}
