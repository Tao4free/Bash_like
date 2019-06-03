#!/bin/bash
#http://www.imagemagick.org/Usage/layers/#layer_prog

input="Case01_input.txt"
fd=output/Case01_merge/
n=0
while IFS= read -r line
do
  #echo "$line"
  rain=$(echo "$line" | cut -d' ' -f1)
  crossI=$(echo "$line" | cut -d' ' -f2)
  crossJ=$(echo "$line" | cut -d' ' -f3)
  #echo $rain $crossI $crossJ
  n=$((n+1))
  n2=`printf "%04d" "${n#0}"`
  fn="Case01_"$n2 
  png=$fd$fn.png
  #echo $rain $crossI $crossJ  $png
  #convert -size 3055x2469  xc:white \ 
  #      $rain         -geometry +780+0  -composite \
  #      $crossI       -geometry +55+467  -composite \
  #      $crossJ       -geometry +0+1468  -composite \
  #      $png
  convert -size 3055x2469  xc:white $rain -geometry +780+0  -composite   $crossI  -geometry +55+467  -composite  $crossJ -geometry +0+1468  -composite  $png
done < "$input"
