#!/bin/bash
# getData.sh - makes directories for data, gets data from poseidon
udi=$1
fixedudi=${udi//:/.}
#base="/home/wnichols/scratch-wnichols-working/"
base="./"
newdir="$fixedudi/$fixedudi-files/"
echo "working on udi - "$fixedudi
echo "creating new dir - "$base$newdir
mkdir -p $base$newdir && cd $_
rsync -avh --dry-run --partial --copy-links --stats --progress wnichols.admin@poseidon:/san/data/store/$udi/ ./
if [ "$?" -eq "0" ]
then
	echo "DRY-RUN SUCCESSFUL"
	rsync -avh --partial --copy-links --stats --progress wnichols.admin@poseidon:/san/data/store/$udi/ ./

else
	echo "DRY-RUN FAILED"
fi	
