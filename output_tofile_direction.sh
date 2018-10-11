#!/bin/bash

echo "#only output message to file if error"
python3 ttt  2>xxx
echo

echo "#only output message to file if success" 
echo "1>yyy" 1>yyy
python3 xxx 1>>yyy
echo

rm xxx yyy

echo "#output all message to file"
python3 ttt 2>&1
echo

echo "#check whether last commad is successful"
python3 xxx 2>\dev\null; echo $?
echo

echo "#check > and >>"
for i in {1..5}; do
 echo {1..5} > jjj
 echo $i >> kkk
done
