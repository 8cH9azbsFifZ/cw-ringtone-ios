# cw-ringtone-ios
https://github.com/8cH9azbsFifZ/cw-ringtone-ios

Create morse code ringtones for iOS.

1. Create the ringtone file:
```docker run -it -v $PWD/data:/data -e TEXT="Mein Text" docker.pkg.github.com/8ch9azbsfifz/cw-ringtone-ios/cw-ringtone-ios:0.4```
2. Copy your ringtones to Dropbox / iCloud / ... (for access with "Files" on iOS)
3. Start GarageBand on iOS, create a new song, import the ringtone file as vocal track, export the song as ringtone.


Uses:
- ffmpeg
- ebook2cw

