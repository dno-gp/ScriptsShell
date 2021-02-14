#!/bin/bash

cp $1 $2.bkp
sed -i 's/\.//g' $1
sed -i 's/,/\./g' $1
sed -i 's/R\$//g' $1

iconv -f "iso-8859-1" -t "utf-8" $1 > file

cut  -d';' -f4-5 file > $2.csv
rm trans*; rm file
