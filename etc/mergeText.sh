textfiles=`find . -name "*.txt"` 
textfiles=`echo $textfiles | tr ' ' '\n' | sort | tr '\n' ' '`

for t in $textfiles;
do
    echo $t >> GCP_NW.txt
    cat $t >> GCP_NW.txt
    echo "" >> GCP_NW.txt
    echo "" >> GCP_NW.txt
done
