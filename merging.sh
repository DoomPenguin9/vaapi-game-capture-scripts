echo Merging files...

ffmpeg -i $(sed -n '1p' filenames.txt).mkv -i $(sed -n '2p' filenames.txt).opus -c copy $(sed -n '1p' filenames.txt).mp4

read -p "Remove original files?[y/n]:" REMOVE

if [ $REMOVE = y ]
then
	rm -rf $(sed -n '1p' filenames.txt).mkv $(sed -n '2p' filenames.txt).opus filenames.txt
else
	:
fi

echo Done
