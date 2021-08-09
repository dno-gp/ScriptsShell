#!/bin/bash
#
# xfpartidos.sh - Extrai informações sobre filiados partidários.
#
# Autor	:Edson Sales <sales_eds@hotmail.com>
#-----------------------------------------------------------------------------
#	Este script baixa dados de filiados partidários disponíveis no site do
#	TSE. Os dados podem ser acessados no link: 	<https://www.tse.jus.br/
#	hotsites/pesquisas-eleitorais/filiacao_partidaria.htm>
#
#	O script formata, filtra e faz ajustes de codificação nos arquivos
#	baixados para posterior manipulação em Sistemas Gerenciadores de Banco de
#	Dados ou linguagem de programação.
#
#-----------------------------------------------------------------------------
#
# Licença: GPL
#
#######################################################################CÓDIGO:
echo -e "Processo iniciado.\n"

mkdir filiados/

# Download dos arquivos no site do tse
for x in $(cat partidos.txt); do #Substituir o aquivo txt por uma array/lista
	wget http://agencia.tse.jus.br/estatistica/sead/eleitorado/filiados/uf/\
		 filiados_${x}_pb.zip
	
	echo "Descompactando arquivos..."
	unzip *.zip
	rm -r *.zip *.pdf aplic/

	mv filiados_* filiados/
	rm -r *.csv	
done

# Filtra arquivos.
cd filiados/ ; pwd

touch auxiliar.txt
touch partidos_ms.txt

for x in $(ls *.csv); do
	iconv -f iso-8859-1 -t utf-8 $x >> auxiliar.txt	# Converte condificação
done

for x in $(cat ../munics.txt); do
	grep -iw "$x" auxiliar.txt >> partidos_ms.txt	# Filtra conforme lista de
													# municipios estabelecidos
done

rm -r auxiliar.txt ; *.csv
mv partidos_ms.txt ../
cd ../
rm -r filiados/

# Ajusta colunas 
cut -d";" -f1-5,8-19 partidos_ms.txt > filiados_mrs.txt; rm -r partidos_ms.txt


echo "Processo finalizado."
##########################################################################FIM.

