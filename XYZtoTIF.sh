#!/bin/bash

files=./origin_select_edit/*.txt
ext=.tif
tarfd=TIF/

mkdir $tarfd

for f in $files
do
 echo $f
 basefile=${f##*/}
 basename=${basefile%$'.'*}
 
 tarf=$tarfd$basename$ext
 echo $tarf
 gdal_translate  -a_srs EPSG:2444  $f $tarf 
done
