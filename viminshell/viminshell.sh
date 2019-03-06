#!/bin/bash

vim sample.txt << E
  ^[
  k
  k
  k
  dd
  :wq
E
  #for i in {1..12}
  #do
  #  #echo $i
  #  1j
  #  58dd
  #done
