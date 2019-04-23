#!/bin/bash

files=`ls *.lay`

for f in $files
do
fd='img/'
name1=$(echo "$f" | cut -d_ -f3)
name2=$(echo "$f" | cut -d_ -f6)
name3=$(echo "$f" | cut -d_ -f4)
name=$name1'_'$name2'_'$name3
ext='.png'
PNGNAME=$fd$name$ext
echo $PNGNAME
tecfocus $f -b -p ExportTemporalPNG_extend_batch.mcr
done
