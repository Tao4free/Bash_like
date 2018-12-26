#!/bin/bash



############################
#     tab_to_dxf
###########################
#source link:
#https://nathanw.net/2011/05/05/3d-dxf-using-ogr/

#synax
#ogr2ogr -f "DXF" {outFile} {inFile} -zfield {ColumnWithZValue}

#example:
#ogr2ogr -f "DXF" test.dxf 05_UV_B_cont_JGDX_171220.TAB -zfield elev


for i in *.shp; do ogr2ogr -of "DXF" "${i%.*}".dxf  "$i" ; done

