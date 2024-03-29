import fs from 'fs';

const TYPE_FILE_VIDEO = "video";
const TYPE_FILE_DOCUMENT = "document";
const TYPE_FILE_PHOTO = "photo";

const UPLOADING = 1;
const SENDING = 2;

const DB_PATH = "./db";

const LOG_TYPE_DOWNLOAD = 'download';
const LOG_TYPE_UPLOAD = 'upload';

class Telegram_file_manager {

    state={}


    constructor(config) {
        //init manager
        this.initState(config);
        this.checkIfFoldersExits();
        this.folderWatcher();
        //Bind method
        // @ts-ignore
        this.saveFile = this.saveFile.bind(this);
        // @ts-ignore
        this.setClient = this.setClient.bind(this);
        // @ts-ignore
        this.uploadFile = this.uploadFile.bind(this);
        // @ts-ignore
        this.downloadFile = this.downloadFile.bind(this);
        // @ts-ignore
        this.onFileUpload = this.onFileUpload.bind(this);
        // @ts-ignore
        this.isClientExists = this.isClientExists.bind(this);
        // @ts-ignore
        this.deleteNestedFiles = this.deleteNestedFiles.bind(this);
        // @ts-ignore
        this.receiveDataAfterUploadFile = this.receiveDataAfterUploadFile.bind(this);
        // @ts-ignore
        this.prepareContentBeforeDownload = this.prepareContentBeforeDownload.bind(this);
        // @ts-ignore
        this.makeTelegramCallToDownloadFile = this.makeTelegramCallToDownloadFile.bind(this);
    }

    initState(config) {
        this['state'] = {
            files: [],
            watch_folder: {},
            client: null,
            to_channel_id: config.to_channel_id,
            folders: {
                uploaded: config.uploaded,
                for_upload: config.for_upload,
                upload_done: config.upload_done
            },
            file_types_handle: config.file_types_handle
        }
    };

    deleteNestedFiles(dir_path) {
        if (!fs.existsSync(dir_path)) return;
        fs.readdirSync(dir_path).forEach(function(entry) {
            const entry_path = dir_path + "/" + entry;
            if (fs.lstatSync(entry_path).isDirectory()) {
                const inner = fs.readdirSync(entry_path);
                if (inner.length) this.deleteNestedFiles(entry_path);

                return fs.rmdirSync(entry_path);
            } else {
                fs.unlinkSync(entry_path);
            }
            // @ts-ignore
        }.bind(this));
    }

    isClientExists() {
        // @ts-ignore
        if (!this.state.client || this.state.client === null) {
            this.deleteNestedFiles(DB_PATH);
            if (fs.existsSync(DB_PATH)) fs.rmdirSync(DB_PATH);
            // @ts-ignore
            process.kill(0)
        }
    }

    //Setup method
    checkIfFoldersExits() {
        // @ts-ignore
        const foldersValues = Object.values(this.state.folders);
        foldersValues.forEach(function iteratePaths(folder:string) {
            // @ts-ignore
            if (folder.length) {
                try {
                    // @ts-ignore
                    if (!fs.existsSync(folder)) fs.mkdirSync(folder);
                } catch (e) {
                    // @ts-ignore
                    console.log(e);
                }
            }
        })

    }

    setClient(airgram) {
        // @ts-ignore
        this.state.client = airgram;
    }

    //Download flow
    downloadFile(content) {
// @ts-ignore
        [TYPE_FILE_DOCUMENT, TYPE_FILE_VIDEO, TYPE_FILE_PHOTO].find(function findCallMethod(type) {

            if (content[type] && this.state.file_types_handle[type]) {
                const file = this.prepareContentBeforeDownload(content[type], type);
                const fileInState = this.state.files.find(doc => doc.path === file.local.path);

                if (fileInState && fileInState.status === SENDING) {

                    this.state.files = this.state.files.filter(doc => doc.path !== file.local.path);

                    const readStream = fs.createReadStream(file.local.path);
                    const localPath = file.local.path;
                    const fileNameAndFormat = localPath.split('/').slice(-1).pop().split(".");

                    //file name and format as array
                    const fileName = fileNameAndFormat.slice(0, -1).pop();
                    const fileFormat = fileNameAndFormat.slice(-1).pop();
                    const writeStream = fs.createWriteStream(
                        `${this.state.folders.upload_done}/${fileName}.${fileFormat}`);

                    const replaceStream = readStream.pipe(writeStream);
                    replaceStream.on('finish', () => fs.unlinkSync(file.local.path));

                    return null
                }

                this.makeTelegramCallToDownloadFile(file)
            }
// @ts-ignore
        }.bind(this));

    }

    prepareContentBeforeDownload(content, type) {
        switch (content._) {
            case TYPE_FILE_DOCUMENT:
            case TYPE_FILE_VIDEO:
                return content[type];
            case TYPE_FILE_PHOTO:
                return content[type].sizes.slice(-1).pop().photo
        }

    }

    makeTelegramCallToDownloadFile({ id }) {
// @ts-ignore
        return this.state.client.api.downloadFile({
            fileId: id,
            priority: 32,
            synchronous: true
        }).then(this.saveFile)
    }

    saveFile(data) {
        const localPath = data.local.path;
        const readStream = fs.createReadStream(localPath);
        const fileNameAndFormat = localPath.split('/').slice(-1).pop().split(".");

        this.logs(data, LOG_TYPE_DOWNLOAD);

        //file name and format as array
        const fileName = fileNameAndFormat.slice(0, -1);
        const fileFormat = fileNameAndFormat.slice(-1).pop();
        // @ts-ignore
        const timeStamp = new Date().getTime();
// @ts-ignore
        const b = fs.createWriteStream(`${this.state.folders.uploaded}/${fileName}_${timeStamp}.${fileFormat}`);

        readStream.pipe(b);
    }

    //Watch folder
    folderWatcher() {
        // @ts-ignore
        if (!this.state.folders.for_upload.length) return null;
        // @ts-ignore
        fs.watch(this.state.folders.for_upload, this.uploadFile.bind(this))
    }

    uploadFile(event, filename) {
        // @ts-ignore
        if (!fs.existsSync(this.state.folders.for_upload + "/" + filename)) return null;
        // @ts-ignore
        console.log("Inn");
        // @ts-ignore
        const path = this.state.folders.for_upload + "/" + filename;
        const uploadconfig = {
            file: { _: 'inputFileLocal', path: path, },
            fileType: { _: 'fileTypeDocument' },
            priority: 32
        };
        // @ts-ignore
        this.state.client.api.uploadFile(uploadconfig).then(this.receiveDataAfterUploadFile)
    }

    receiveDataAfterUploadFile(data) {
        // @ts-ignore
        console.log(data)
        if (data.remote.id) {
            // @ts-ignore
            this.state.files.push({
                status: SENDING,
                path: data.local.path
            });
            return this.sendFile(data, false);
        }
// @ts-ignore
        this.state.files.push({
            status: UPLOADING,
            path: data.local.path
        });

    }

    sendFile(data, isLocal = true) {
        this.logs(data, LOG_TYPE_UPLOAD);
        const fileContext = {
            _: 'inputFileId',
            id: data.id
        };

        if (!isLocal) {
            fileContext._ = 'inputFileRemote';
            fileContext.id = data.remote.id
        }

// @ts-ignore
        const fileInState = this.state.files.find(doc => doc.path === data.local.path);
        if(fileInState.status !== SENDING) fileInState.status = SENDING;

// @ts-ignore
        this.state.client.api.sendMessage({
            // @ts-ignore
            chatId: +this.state.to_channel_id,
            replyToMessageId: 0,
            disableNotification: false,
            fromBackground: true,
            inputMessageContent: {
                _: 'inputMessageDocument',
                document: fileContext
            }
        })
    }

    //File events
    onFileUpload(file) {
        // @ts-ignore
        const dc = this.state.files.find(doc => doc.path === file.local.path);
        if (!file.remote.isUploadingActive && dc && dc.status !== SENDING) {
            dc.status = SENDING;
            this.sendFile(file)

        }
    }


    //logs
    logs(file, type){
        switch (type) {
            case LOG_TYPE_DOWNLOAD:{
                return `Downloading File ${file.local.path}, uploaded size ${file.remote.uploadedSize}`
            }
            case LOG_TYPE_UPLOAD:{
                return `Uploading File ${file.local.path}, uploaded size ${file.remote.uploadedSize}`
            }
        }
    }
}

export default Telegram_file_manager
