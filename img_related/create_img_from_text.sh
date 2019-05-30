#!/bin/bash
input="time.list"
while IFS= read -r line
do
  echo "$line"
  png="$line.png"
  png=`echo  ${png// /_}`
  png=`echo  ${png//\//_}`
  png=`echo  ${png//\:/}`
  convert -background lightblue -fill blue -pointsize 48 \
  label:"$line"  $png
done < "$input"
