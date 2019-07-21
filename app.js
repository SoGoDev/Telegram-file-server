const fs = require('fs');
const os = require('os');
const { Airgram, Auth, prompt } = require('airgram');
const { UPDATE } = require('airgram-api');
const config = require('./config.json');

const airgram = new Airgram({
    apiId: Number(config.app_id),
    apiHash: config.app_hash,
    logVerbosityLevel: 2,
    command: `./td/build/${config.CPP_LIB[os.type()]}`
});

const auth = new Auth(airgram);

auth.use({
    code: () => prompt(`Please enter the secret code:\n`),
    phoneNumber: config.phone_number
});

airgram.updates.on(UPDATE.updateNewMessage, ({ update }, next) => {
    if (update.message.content.document) {
        downloadFile(update.message.content.document.document)
    } else if (update.message.content.video) {
        downloadFile(update.message.content.video.video)
    } else if(update.message.content.photo) {
        const photo = update.message.content.photo.sizes;
        downloadFile(photo[photo.length-1].photo)
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
        console.log(data.local.path);
        const a = fs.createReadStream(data.local.path);
        const filePath = data.local.path.split('/');
        //file name and format as array
        const c = filePath[filePath.length -1].split(".");
        const name = c.slice(0, -1);
        const format = c[c.length-1];
        const b = fs.createWriteStream(`.${config.folder}/${name}_${new Date().getTime()}.${format}`, { flag: 'w' });
        a.pipe(b);
        fs.unlinkSync(data.local.path);
    })
}
