#!/bin/bash

DIRPATH="$(pwd)"
# Input if you want to set a custom output directory. If you input n, then the files will be outputted into the directory you are running the script from
read -p "Do you want to set a directory to write the recorded files to[y/n]:" DIR
if [[ $DIR = y ]]
then
	read -p "Output directory path:" DIRPATH
else
	:
fi

# Video capture
echo Outputting to $DIRPATH
tmux new-session -d
tmux set-option remain-on-exit off
tmux split-window "LIBVA_DRIVER_NAME=radeonsi ffmpeg -y -device /dev/dri/card0 -f kmsgrab -framerate 60 -vsync 0 -i - -vf 'hwmap=derive_device=vaapi,crop=2560:1440:0:0,scale_vaapi=w=2560:h=1440:format=nv12' -c:v hevc_vaapi -b:v 60M $DIRPATH/$(date +"%Y_%m_%d_%I_%M_%p").mkv"

# Sound capture
echo "$(date +"%Y_%m_%d_%I_%M_%p")" > $DIRPATH/filenames.txt
tmux split-window "ffmpeg -y -f pulse -i default -b:a 192k $DIRPATH/$(date +"%Y_%m_%d_%I_%M_%p")-audio.opus"
echo "$(date +"%Y_%m_%d_%I_%M_%p")-audio" >> $DIRPATH/filenames.txt
