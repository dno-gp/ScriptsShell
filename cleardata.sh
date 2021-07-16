#!/bin/bash
#
# dataclear.sh - Faz ajustes de formatação em arquivos contendo dados.
#
# Site		:
# Autor		:Edson Sales <sales_eds@hotmail.com>
# Manutenção	:
#
#---------------------------------------------------------------------------
# Este programa recebe como parâmetro o nome do arquivo,
# do qual é gerado uma cópia com as alterações estabelecidas.
#
#	Exemplo:
#		$ ./cleatdata.sh arquivo
#
#---------------------------------------------------------------------------
# 
#
# Histórico:
#
#
# Licença: GPL
#---------------------------------------------------------------------------
echo "codificação do arquivo:"; file $1 #TODO Estes dois comandos devem ser exibidos na mesma linha no momento da execução.
sed -i '1s/^.*$/\L&/g' $1	# Converte cabeçalho (1ªlinha) para letras minúsculas.

###########################################################################FIM
