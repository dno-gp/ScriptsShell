#!/bin/bash
#
# datatcepb.sh - Ajusta o conjunto de dados contidos em um arquivo.
#
# Autor	:Edson Sales<sales_eds@hotmail.com>
#
# ----------------------------------------------------------------------------
# O programa ajusta tabela de dados refentes ao funcionalismo público,
# coletados do site do Triubunal de Contas do estado da Paraíba.
# <https://sagresonline.tce.pb.gov.br/#/municipal/inicio>
#
# Recebe como parâmetro um arquivo contendo dados, o qual
# será modificado conforme as instruções contidadas no código.
# 
# Exemplo:
#		$ ./datatcepb.sh arquivo.txt

################################### CÓDIGO ###################################

sed -i '1s/^.*$/\L&/' $1
sed -i '1s/ (bruto)//' $1
sed -i 's/Fundo Municipal de Assistência Social de Sapé/FMAS/g' $1
sed -i 's/Fundo Municipal de Saúde de Sapé/FMS/g' $1
sed -i 's/Fundo de Previdência de Sapé/FMPS/g' $1
sed -i 's/Prefeitura Municipal de Sapé/PM/g' $1
