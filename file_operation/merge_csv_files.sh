#!/usr/bin/env bash

awk 'FNR==1 && NR!=1{next;}{print}' *.csv > one.csv
