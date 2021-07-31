#!/bin/bash
# setScratchPerm.sh - grant scratch group permissions to folder
folder=$1
echo "before permission change - "$folder
ls -alh $folder
stat -c '%A %a %n' $folder
find $folder -type d -exec chmod 750 {} \;
find $folder -type f -exec chmod 640 {} \;
chgrp -R scratch $folder
echo "after permission change - "$folder
ls -alh $folder
stat -c '%A %a %n' $folder
echo "done"
