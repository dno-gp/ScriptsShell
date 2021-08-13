#!/bin/bash
#
# sdefeso.sh - Coleta dados de beneficiários do Seguro Defeso
#
# Autor:    Edson Sales <sales_eds@hotmail.com>
#
#-----------------------------------------------------------------------------
#  Este script baixa dados de beneficiários do Seguro Defeso, disponíveis no
#  Portal da Tranparência do Governo Federal, podendo ser acessados em:
#  <http://www.portaltransparencia.gov.br/download-de-dados/seguro-defeso>.
#
#-----------------------------------------------------------------------------
#
# Licença: GPL.
#
#######################################################################CÓDIGO:

if [ -e /usr/bin/figlet ]; then

  figlet Seguro Defeso

fi

echo -e "Beneficiários Seguro Defeso (pescador artesanal)"
echo -e Processo de extração de dados iniciado...
cd data/

# Baixa arquivos
echo -e "\nExecutando downloads..."
for x in $(grep -v "#" ../config/periodo.txt)
do wget -c --show-progress  http://www.portaltransparencia.gov.\
br/download-de-dados/seguro-defeso/${x}.zip
done

# Descompacta arquivos
echo -e "\nDescompactando arquivos baixados..."
for i in $(ls *.zip)
do unzip  $i
done
echo "Arquivos descompactados."

touch auxiliar.txt ; echo -e "\nArquivo auxiliar.txt criado."

# Filtra arquivos
echo -e "\nFiltrando dados dos arquivos baixados..."

for i in $(ls *.csv)
do for x in $(grep -v "#" ../config/munics.txt)
   do grep -iw "$x" $i > arq.txt
      cat arq.txt >> auxiliar.txt
   done
done

grep -iw 'pb' auxiliar.txt > beneficiarios.csv
mv beneficiarios.csv ../output/

echo -e "\nRemovendo arquivos desnescessários..."
rm -vr arq.txt
rm -vr 201*
rm -vr auxiliar.txt

echo -e "Processo finalizado!"

##########################################################################FIM:
