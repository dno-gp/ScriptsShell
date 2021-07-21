#!/bin/bash
#
# Este script faz ajustes de formatação em arquivos contendo dados sobre
# Transferências Constitucionais aos municípios.
# Os dados estão disponíveis em: <https://sisweb.tesouro.gov.br/apex/f?p=2600:1>.
# 
# Autor		:Edson Sales <sales_eds@hotmail.com>
# 
#---------------------------------------------------------------------------


cp $1 $2.bkp
sed -i 's/\.//g' $1
sed -i 's/,/\./g' $1
sed -i 's/R\$//g' $1

iconv -f "iso-8859-1" -t "utf-8" $1 > file

cut  -d';' -f4-5 file > $2.csv
rm trans*; rm file
