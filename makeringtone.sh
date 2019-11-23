#!/bin/bash
#text="$@"
text=$TEXT
name=$(echo $text |sed 's/ /_/g')

tmp1=Chapter0000.mp3
tmp2=$name.m4r

echo $text |ebook2cw 

ffmpeg -i $tmp1 -acodec libfdk_aac -f ipod $tmp2

rm $tmp1
