# cw-ringtone-ios
Create morse code ringtones for iOS.

1. Create the ringtone file
    docker run -it -v $PWD/data:/data -e TEXT="Mein Text" asdlfkj31h/cw-ringtone-ios:0.1
2. Copy your ringtones to Dropbox / iCloud / ... (for access with "Files" on iOS)
3. Start GarageBand on iOS, create a new song, import the ringtone file as vocal track, export the song as ringtone.

Uses:
- ffmpeg
- ebook2cw

