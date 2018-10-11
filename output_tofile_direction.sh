#!/bin/bash

python3 ttt  2>xxx
echo "1>yyy" 1>yyy
python3 ttt 2>&1

python3 xxx 2>\dev\null; echo $?
