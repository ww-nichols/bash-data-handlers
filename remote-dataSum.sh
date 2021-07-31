#!/bin/bash
# dataInfo.sh - gets information about a dataset
d=$1
p=$(dirname "$d")
b=$(basename $d)
f="./$b-datasetFileInfo.txt"
echo "File Checks and Listing generated by GRIIDC" > $f
echo "Scanning path - $d" >> $f
echo -e "\n" >> $f
# get file extension information
echo 'File Extensions' >> $f
find $d -type f | perl -ne 'print $1 if m/\.([^.\/]+)$/' | sort | uniq | tr '\n' ',' >> $f
echo -e "\n" >> $f
find $d -type f | perl -ne 'print $1 if m/\.([^.\/]+)$/' | sort | uniq -c | sort -nr >> $f
echo "Total files - $(find $d -type f | wc -l)" >> $f
echo -e "\n" >> $f
# empty folder check
echo "Empty folder check - $(find $d -type d -empty | wc -l)" >> $f 
find $d -type d -empty >> $f
echo -e "\n" >> $f
# empty file check
echo "Empty file check - $(find $d -type f -empty | wc -l)" >> $f 
find $d -type f -empty >> $f
echo -e "\n" >> $f
# find disallowed files
echo "Disallowed files check - $(find $d -name "._*" -o -iname "*DS_store*" -o -iname "thumbs.db" | wc -l)" >> $f
find $d -name "._*" -o -iname "*DS_store*" -o -iname "thumbs.db" >> $f
echo -e "\n" >> $f
# get directory structure
echo "Directory Structure" >> $f
tree $d -d >> $f
echo -e "\n" >> $f
# get filelist
echo "File List" >> $f
tree $d --du -ah >> $f