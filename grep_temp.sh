#!/bin/bash

field='Ame-832 Ame-47819 Ame-47821 Ame-1240  Ame-840  Ame-842 Ame-835 Ame-834 Ame-923 Ame-1348 Ame-1081 Ame-833' 

tarf=temp_2011-201712.dat

n=0
for f in $field; do
    #(($n++))
	let "n++"	
	#echo $n
	nstr=`printf "%02d" $n`
	#echo $nstr
	grep $f $tarf > temp$nstr
done
	
#for n in {01..12}; do
#	echo $n
#	echo "${field["${n}"]}"
#done
