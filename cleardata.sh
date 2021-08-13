#!/bin/bash
#
# dataclear.sh - Faz ajustes de formatação em arquivos contendo dados.
#
# Autor		:Edson Sales <sales_eds@hotmail.com>
#
#-----------------------------------------------------------------------------
# Este programa recebe como parâmetro o nome do arquivo,
# do qual é gerado uma cópia com as alterações estabelecidas.
#
#	Exemplo:
#		$ ./cleatdata.sh arquivo
#
#-----------------------------------------------------------------------------
#
# Licença: GPL
#
#######################################################################CÓDIGO:

echo "codificação do arquivo: "; file $1 #TODO exibir/print em mesma linha.
sed -i '1s/^.*$/\L&/g' $1 # Converte cabeçalho(Linha 1)para letras minúsculas.

##########################################################################FIM.
