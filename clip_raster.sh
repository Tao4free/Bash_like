#!/bin/bash

files=`ls *.tif`

key='bf3m.shp'
tarf='../shp/'
cutf=`ls "$tarf"*$key`

#for cf in $cutf
#do
#  #echo $cf
#  ver=`echo   $cf | cut -d'_' -f1 | cut -d'/' -f3`
#  echo $ver
#done

for f in $files
do
  #echo $f
  case=`echo   $f | cut -d'_' -f1`
  #echo $case

  for cf in $cutf
  do
    #echo $cf
    ver=`echo   $cf | cut -d'_' -f1 | cut -d'/' -f3`
    #echo $ver
   
    #if [ ${case} = ${ver} ]; then
    #   echo "equal"
    #fi

    if [ ${case} = ${ver} ]; then
    echo $f
    echo $cf
    gdalwarp -cutline $cf -crop_to_cutline  $f clip_$f
    #gdalwarp -cutline $cf -crop_to_cutline -dstalpha $f clip_$f
    fi

  done  

done

