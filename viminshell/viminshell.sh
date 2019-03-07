#!/bin/bash
# reference : https://stackoverflow.com/questions/15077585/open-vim-and-run-script-upon-opening 

#vim sample.txt << E
#  "+gg"
#  "+2j"
#  "+dd"
#  :wq
#E
  #for i in {1..12}
  #do
  #  #echo $i
  #  1j
  #  58dd
  #done
vim "+1" "+3" -c ":d" -c ":wq"  sample.txt
