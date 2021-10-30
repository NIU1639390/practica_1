#!/bin/bash
cut -d , -f 1,2,3,4,5,6,7,8,9,10,11,13,14,15 CAvideos.csv > CAvideos1.csv

awk -F , 'NR==1 || $12== "True"|| $12=="False"'   CAvideos1.csv  > CAvideos2.csv
awk -F , 'NR==1 || $13== "True"|| $13=="False"'   CAvideos2.csv  > CAvideos3.csv
awk -F , 'NR==1 || $14== "True"|| $14=="False"'   CAvideos3.csv  > CAvideos4.csv

awk -F , 'NR==1 || $14=="False"'   CAvideos4.csv  > CAvideos5.csv

