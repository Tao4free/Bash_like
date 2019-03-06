ed!/bin/bash

#sed -i -e 's/No22/No01/g' input.txt
input='input.txt'

for i in {01..21}; do
x=$( printf "%02d" "${i#0}" )
x='No'$x

read line < $input
#echo $line
now=${line##*' '}
sed -i -- "s/$now/$x/g" $input
sed -i -- "s/\r//g" $input

./go.eb;
sleep 5

done
