#!/bin/bash
#
# 	datatransfconstitucional.sh - Formata dados em um arquivo
# 
# 	Autor:	Edson Sales <sales_eds@hotmail.com>
# 
#-----------------------------------------------------------------------------
# 	Este script faz ajustes de formatação em arquivos contendo dados sobre
# 	Transferências Constitucionais aos municípios. Os dados estão disponíveis
# 	em: <https://sisweb.tesouro.gov.br/apex/f?p=2600:1>, podendo ser baixados.
# 
#	O script recebe dois parâmetros, o primeiro é o arquivo para os ajustes,
#	o segundo parâmetro trata-se de uma identificação criada pelo usuário,
#	o qual identificará o arquivo gerado com as modificações e o arquivo de
#	backup.
#
#	Exemplo:
#		$ ./datatransfconstitucional arquivo.txt meuarquivo
#		meuarquivo.csv
#		meuarquivo.bkp
#
#-----------------------------------------------------------------------------
#
#	Licença: GPL.
#
###################################################################### CÓDIGO:

cp $1 $2.bkp
sed -i 's/\.//g' $1
sed -i 's/,/\./g' $1
sed -i 's/R\$//g' $1

iconv -f "iso-8859-1" -t "utf-8" $1 > file

cut  -d';' -f4-5 file > $2.csv
rm trans*; rm file

######################################################################### FIM.
