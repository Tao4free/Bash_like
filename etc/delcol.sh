#!/bin/bash

files=`ls ./*.txt`

for f in $files; do
	#echo $f
	name="${f%.*}"
	of=$name'_edit.csv'
	echo $of
	cut -d, -f2-4 $f &> $of
done
