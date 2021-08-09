#!/bin/bash

###############
#SEGURO DEFESO#
###############

if [ -e /usr/bin/figlet ]; then

  figlet Seguro Defeso

fi

echo -e "Beneficiários seguro defeso (pescador artesanal)"
echo -e Processo de extração de dados iniciado...

#baixar arquivos
echo -e "\nExecutando downloads..."
for x in $(cat periodo.txt)
do wget -c --show-progress  http://www.portaltransparencia.gov.br/download-de-dados/seguro-defeso/${x}.zip
done

#desconpactar arquivos
echo -e "\nDescompactando arquivos baixados..."
for i in $(ls *.zip)
do unzip  $i
done
echo "Arquivos descompactados."

touch auxiliar.txt ; echo -e "\nArquivo auxiliar.txt criado."

#filtrar arquivos
echo -e "\nFiltrando dados dos arquivos baixados..."

for i in $(ls *.csv)
do for x in $(cat munics.txt)
   do grep -iw "$x" $i > arq.txt
      cat arq.txt >> auxiliar.txt
   done
done

grep -iw 'pb' auxiliar.txt > beneficiados2018.csv

echo -e "\nRemovendo arquivos desnescessários..."
rm -vr arq.txt
rm -vr 201*
rm -vr auxiliar.txt

echo -e "Processo finalizado!"
