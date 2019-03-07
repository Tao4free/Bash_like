#!/bin/bash

for i in *.tif; do gdal_translate -of XYZ "$i"  "${i%.*}".xyz; done

for i in ./old/*.xyz; do grep -v " -9999" $i > $(basename -- "$i"); done

for i in *.tif; do gdal_translate -co force_cellsize=true -of AAIGrid "$i"  "${i%.*}".asc; done
