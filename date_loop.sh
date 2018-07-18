#!/bin/bash

d=2015-12-20

while [ "$d" != 2016-01-20 ]; do 
  #echo $d

  year=`echo $d | cut -c1-4`
  month=`echo $d | cut -c6-7`
  day=`echo $d | cut -c9-10`
  echo $year $month $day

  d=$(date -I -d "$d + 1 day")
done
