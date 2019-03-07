for i in *.tif; do echo "${i%.*}".xyz; done



for i in ./old/*.xyz; do echo $(basename -- "$i"); done



for i in ./old/*.xyz; do grep -v " -9999" $i > $(basename -- "$i"); done
