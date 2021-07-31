#!/bin/bash
# media-tester.sh - gets information about a dataset using mediainfo
d=$1
p=$(dirname "$d")
b=$(basename $d)
f="${p}/$b-media-tester.txt"
echo "File Checks and Listing generated by GRIIDC" > $f
echo "Scanning path - $d" >> $f
echo -e "\n" >> $f
# get file extension information
echo 'Files' >> $f
#for filename in "$d"/*; do
	find $d -type f -exec mediainfo --Output=file://media-tester-template.txt "$filename" >> $f 2>&1 {} \;
# MAYBE FIGURE OUT SOMTHING THAT SORTS
# ALSO NEED TO RUN FFMPEG/FFPROBE?