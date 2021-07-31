#!/bin/bash
# packer/tester/hasher - packs dir as tar.gz and tests and hashes
d=$1
p=$(dirname "$d")
b=$(basename $d)
tarTarget="${p}/$b.tar.gz"
echo "Making $tarTarget"
tar -cf $tarTarget --use-compress-program pigz $d
echo "$tarTarget made"
testTarget="$tarTarget.tartest.txt"
hashTarget="$tarTarget.sha256.txt"
echo "making $testTarget and $hashTarget"
tar -tvf $tarTarget --use-compress-program pigz > $testTarget & sha256sum $tarTarget > $hashTarget
wait
echo "done"
