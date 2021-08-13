#!/bin/bash
#
# bfamilia.sh - Coleta dados de beneficiários do Programa Bolsa Família - PBF.
#
# Autor:    Edson Sales <sales_eds@hotmail.com>
#
#-----------------------------------------------------------------------------
#  Este script baixa dados de beneficiários do PBF, disponíveis no Portal
#  da Tranparência do Governo Federal, podendo ser acessados em:
#  <http://www.portaltransparencia.gov.br/download-de-dados>.
# 
#-----------------------------------------------------------------------------
#
# Licença: GPL.
#
#######################################################################CÓDIGO:

if [ -e /usr/bin/figlet ]; then

   figlet Programa
   figlet Bolsa Familia

fi

echo "Beneficiários do Prgrama Bolsa Família."
echo "Processo de extração de dados iniciado..."

cd data/
touch auxiliar.txt

# Baixa arquivos
for x in $(grep -v "#" ../config/periodo.txt)
do echo -e "\nExecutando download..."

   if [ -e ./$x.zip ]; then

   echo O arquivo $x.zip já existe.

   else
   wget --show-progress  http://www.portaltransparencia.gov.br\
/download-de-dados/bolsa-familia-pagamentos/${x}.zip

   echo -e "\nDescompactando arquivo..."
   unzip $x.zip
   echo "Arquivo descompactado."

   echo -e "\nFiltrando dados do  arquivo..."
   for i in $(grep -v "#" ../config/munics.txt)
   do grep -iw "$i" *.csv  > arq.txt
      cat arq.txt >> auxiliar.txt
   done

  echo -e "\nRemovendo arquivos desnecessários..."
  rm -vr *.csv
  rm -vr arq.txt

  fi

done

# TODO trecho de código abaixo necessita ser melhorado.

echo -e "\nCriando arquivo com os resultados..."

grep -iw "pb" auxiliar.txt > beneficiarios.txt

sed -i 's/,/./g' beneficiarios.txt
sed -i 's/.$//g' beneficiarios.txt
sed -i 's/CRUZ DO ESPIRITO SANTO//g' beneficiarios.txt
sed -i 's/JURUPIRNGA/2/g' beneficiarios.txt
sed -i 's/MARI/3/g' beneficiarios.txt
sed -i 's/3A/MARIA/g' beneficiarios.txt
sed -i 's/PILAR/4/g' beneficiarios.txt
sed -i 's/RIACHAO DO POCO/5/g' beneficiarios.txt
sed -i 's/SAO JOSE DOS RAMOS/6/g' beneficiarios.txt
sed -i 's/SAO MIGUEL DE TAIPU/7/g' beneficiarios.txt
sed -i 's/SAPE/8/g' beneficiarios.txt
sed -i 's/SOBRADO/9/g' beneficiarios.txt

echo "Arquivo com resultados criado."

echo -e "\nMovendo aquivos .zip..."
rm -vr *.zip
mv beneficiarios.txt ../output/
echo -e "\nArquivos movidos."

echo -e "\nRemovendo auxiliar.txt..."
rm -vr auxiliar.txt

echo -e "\nProcesso finalizado!"

##########################################################################FIM.
