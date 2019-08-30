# Telegram-file-server
Telegram file server handle all files that you recieve from chats and save to local folder

## System preferences
Ubuntu 16^  
Mac Os 10^ 

## How to deploy

Run `npm run deploy` to run bash script that depoy for you project

Go to https://my.telegram.org/auth to registrate your app 
Copy your `app_hash` and `app_id` to config.json 

Run `npm start` to start  
Run `npm run stop` to stop project

##Config preferences

app_id => application id from telegram  
app_hash => application hash from telegram  
phone_number => number that related to your account  
folder => folder which will receive files "should has full path"
CPP_LIB => names of td lib config !! ###DONT TOUCH THIS###   
watches_folders => folder from there file`s will send to chat files "should has full path"  
to_channel_id => chat that will receive files  
file_types_handle => configuration of file types that you want receive   

