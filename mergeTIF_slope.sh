#!/bin/bash

files=`ls ./TIF/*.tif`
ext=.tif
tarfd=./

mkdir $tarfd

#echo $files

gdalwarp    $files $tarfd/DEMAfter_merge_0.tif

gdal_translate -a_srs EPSG:2444  -of GTiff -a_nodata 0 $tarfd/DEMAfter_merge_0.tif $tarfd/DEMAfter_merge.tif


gdaldem slope DEMAfter_merge.tif DEMAfter_merge_slope.tif

#for f in $files
#do
# echo $f
# basefile=${f##*/}
# basename=${basefile%$'.'*}
 
# tarf=$tarfd$basename$ext
# echo $tarf
# gdal_translate $f $tarf 
#done
