#!/bin/bash
trap "" 2 20 ;
#### 
#### Para executar o script: ./codigo_pais_1.0.sh
#### Alterar as permissões: chmod 755 codigo_pais_1.0.sh
####
#### Este script tem a funcionalidade de criar lista com o codigo do pais,
#### acrescentar uma virgula no final de cada numero da lista e ainda gerar uma 
#### frase para cada linha após o numero e a virgula com 1 espaço.
#### 554299123456, Frase para enviar o sms aos clientes <-- Para enviar pela web e linha de comando
#### 554299123456, <---- Para enviar pela web
#### 554299123456 <---- Para enviar pela linha de comando
####
#### Um arquivo com o nome de "celular.csv" precisa estar junto do scprit
#### os numeros precisam estar no seguinte formato um embaixo do outro
#### 04299123456 (zero ddd e numero) ou
#### 4299123456 ( ddd e numero)
####
#### Conteudo da lista criada: NUMERO
#### Conteudo da lista criada: NUMERO, MENSAGEM
#### Conteudo da lista criada: NUMERO,
####
#### Opiniões ou sugestões são bem vindos para melhora-lo, repassem no email
#### 
#### Este script pode ser alterado, editado mas pessoal mantenha os créditos hehe :)
#### Espero que este script seja útil para você!!
####
clear
echo ""
echo -e "\e[00;36m ##############################################################################\e[00m"
echo -e "\e[00;36m #                                                                            #\e[00m"
echo -e "\e[00;36m #     SYSOP Linux - Soluções em Software Livre                               #\e[00m"
echo -e "\e[00;36m #     www.sysoplinux.com.br                                                  #\e[00m"
echo -e "\e[00;36m #     contato@sysoplinux.com.br                                              #\e[00m"
echo -e "\e[00;36m #     Jesus Leal - 55 42 9915.5639                                           #\e[00m"
echo -e "\e[00;36m #                                                                            #\e[00m"
echo -e "\e[00;36m #     Sistema de concatenação de código do país para criação de listas       #\e[00m"
echo -e "\e[00;36m #                                                                            #\e[00m"
echo -e "\e[00;36m ##############################################################################\e[00m"
echo ""
TEST=`ls celular.csv 2> /dev/null`;
ERRO=`echo $?`;
if [ $ERRO == "0" ] ; then
	echo -e "\e[00;36m O arquivo celular.csv existe.\e[00m"
	echo ""
		ARQ=celular.csv
		if [ -d $ARQ ]; then
			echo - e '\e[00;36m O arquivo é um diretório\e[00m'
		fi 
		if [ -r $ARQ ]; then
			echo -e "\e[00;36m Você tem permissão para ler o arquivo celular.csv. \e[00m"
		fi
		if [ -w $ARQ ]; then
			echo -e "\e[00;36m Você tem permissão para alterar o arquivo celular.csv \e[00m"
		else
			echo -e "\e[00;36m Você não tem permissão para alterar o arquivo celular.csv. \e[00m"
		fi
		if [ -x $ARQ ]; then
			echo -e "\e[00;36m Você tem permissão para executar o arquivo celular.csv. \e[00m"
		else
			echo -e "\e[00;36m Você não tem permissão para executar o arquivo celular.csv. \e[00m"
		fi
	echo ""
	echo -e "\e[00;36m ------------------------------------------------------------------------------\e[00m"
else
	echo -e "\e[01;32m O Arquivo celular.csv não existe. \e[00m"
	echo ""
	echo -e "\e[01;32m Favor criar arquivo celular.csv e colocá-lo no mesmo diretório do programa. \e[00m"
	echo ""
	echo -e "\e[00;36m ------------------------------------------------------------------------------\e[00m"
	sleep 1	
	exit
	echo ""
fi
Principal() {
echo ""
echo "" >> celular.csv ; sed -i '/^$/d' celular.csv ; cat celular.csv | sed 's/^0\t*//' |  sed 's/^/55/g' > .celular-tmp ;
wc .celular-tmp | awk -F" " '{print $1}' > .celular-tmp1;
O=0
while [ "$O" -eq "0"  ] ; do
echo "Pacotes de sms disponíveis: "
echo "Seu arquivo possui `cat .celular-tmp1` linhas."
echo ""
echo "   [ 1 ] -  100"
echo "   [ 2 ] -  200"
echo "   [ 3 ] -  500"
echo "   [ 4 ] -  1000"
echo "   [ 5 ] -  2500"
echo "   [ 6 ] -  5000"
echo "   [ 7 ] -  10000"
echo "   [ 8 ] -  20000"
echo "   [ 9 ] -  50000"
echo "   [ r ] -  Recarregar"
echo "   [ e ] -  Sair"
echo ""
echo -n "Digite a opção desejada e precione Enter: "
read N
O=1
case $N in 
1) SMS100 ;;
2) SMS200 ;;
3) SMS500 ;;
4) SMS1000 ;;
5) SMS2500 ;;
6) SMS5000 ;;
7) SMS10000 ;;
8) SMS20000 ;;
9) SMS50000 ;;
r) clear ; source .codigo_pais.sh ;;
e) clear ; exit ;;
*)
	echo ""
	echo "Opção inválida! Escolha uma das opções acima e precione Enter. " ; 
	sleep 1.5
	O=0
	clear
esac
done
}
DATE=$(date "+%T")

SMS100() {
	echo ""
	echo -n -e "\e[01;36mInforme o nome da Empresa \"sem espaços\" : \e[00m" ; read EMPRESA
	clear
	echo ""
	echo "A opção informada é 1  :: 100 SMSs ::"
	SMS100=100
	cat celular.csv | sed 's/^0\t*//' | sed 's/^/55/g' > .celular-tmp ;
	wc .celular-tmp | awk -F" " '{print $1}' > .celular-tmp1 ;
	CONT=`cat .celular-tmp1`;
		if [ "$SMS100" -gt "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			echo ""
       			echo "Esta lista possui $CONT linhas, seu arquivo csv possui MENOS de $SMS100 linhas com numero de celulares."
			echo ""
        		read -n4 -a SN -p "Deseja que o programa crie uma lista com MENOS de $SMS100 linhas? s|n "
				if [[ "$SN" == +(s|S|sim|Sim|SIM) ]] ; then 
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					#cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv ;
					#echo ""
                    #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
					Q=0 ;
									while [ "$Q" -eq "0" ] ; do
									echo ""
									read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
									if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
										sleep 0.5
										echo "Sim ...."
										sleep 0.5
										echo ""
										cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv ;
										echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
										sleep 1
									Q=1
									
									elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
										sleep 0.5
										echo "Não ...."
										echo ""
										sleep 0.5
										echo "Lista com numeros não criada."
										sleep 1
									Q=1
									else
										echo ""
										echo "Opção inválida! Vamos tentar novamente ..."
										sleep 1
									Q=0
									fi
									done
					R=0 ;
					while [ "$R" -eq "0" ] ; do
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then					
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						echo ""
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4 ;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONT-mensagem.csv ;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
					R=1
					
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
					R=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
					R=0
					fi
					done
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						echo ""
						sleep 0.5
						cat .celular-tmp | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo "Nova lista criada com sucesso! "						
						sleep 1
					V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						echo ""
						clear
					V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
					V=0
					fi					
					sleep 0.5
					done
		I=1
				elif [[ "$SN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhum arquivo criado."
					sleep 1
		I=1				
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
		I=0
				fi
		done 
clear
Principal
		
            elif [ "$SMS100" -lt "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			echo ""
                      	echo "Esta lista possui $CONT linhas, seu arquivo csv possui MAIS de $SMS100 linhas com numero de celulares."
			echo ""
			read -n4 -a SN -p "Deseja que o programa crie uma lista com MAIS de $SMS100 linhas? s|n "
				if [[ "$SN" == +(s|S|sim|Sim|SIM) ]] ; then
					grep -v "^#" .celular-tmp | sed '/^$/d' | head -199 > .celular-tmp2;
					LISTAHEAD=`cat .celular-tmp2`;
					wc .celular-tmp2 | awk -F" " '{print $1}' > .celular-tmp3;
					CONTLINHAS=`cat .celular-tmp3`;                                        
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					#cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv
					#echo ""
                    #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
					echo ""
					read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
					if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						echo ""
						cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv
                        echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
						sleep 1
					Q=1
					
					elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Lista com numeros não criada."
						sleep 1
					Q=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
					Q=0
					fi
					done					
					R=0
					while [ "$R" -eq "0" ] ; do
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						echo ""
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp2 | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONTLINHAS-mensagem.csv ;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
					R=1
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
					R=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
					R=0
					fi
					done
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						echo ""
						sleep 1
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "
						sleep 1
					V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
					V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
					V=0
					fi					
					sleep 0.5
					clear
					done
		I=1
			elif [[ "$SN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
		                sleep 0.5
				echo "Não ...."
				grep -v "^#" .celular-tmp | sed '/^$/d' | head -100 > .celular-tmp2;
				LISTAHEAD=`cat .celular-tmp2`;
				wc .celular-tmp2 | awk -F" " '{print $1}' > .celular-tmp3;
				CONTLINHAS=`cat .celular-tmp3`;
				#cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv;		
				#echo ""
				#echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
					echo ""
					read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
					if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						echo ""
						cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv
                                        	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
						sleep 1
					Q=1
					
					elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Lista com numeros não criada."
						sleep 1
					Q=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
					Q=0
					fi
					done					
				R=0
				while [ "$R" -eq "0" ] ; do
				echo ""
				read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then
						sleep 0.5
						echo "Sim ...."
						echo ""
						sleep 0.5
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp2 | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONTLINHAS-mensagem.csv;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
					R=1
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
					R=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
					R=0
					fi
					done					
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						echo ""
						sleep 0.5
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "
						sleep 1
					V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
					V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
					V=0
					fi					
					sleep 0.5
					clear
					done
		I=1
                                else
                                        echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
					clear
		I=0
                                fi
		done
clear
Principal
                elif [ "$SMS100" -eq "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			#cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv
                        #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
			Q=0 ;
			while [ "$Q" -eq "0" ] ; do
				echo ""
				read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
				if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					echo ""
					cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv ;
                    echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
					sleep 1
				Q=1
				
				elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Lista com numeros não criada."
					sleep 1
				Q=1
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
				Q=0
				fi
				done
			R=0
			while [ "$R" -eq "0" ] ; do
			echo ""
			read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
				if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then
					sleep 0.5
					echo "Sim ...."
					echo ""
					sleep 0.5
					echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
					cat .celular-tmp | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
					cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONT-mensagem.csv ;
					echo ""
					echo "Mensagem anexada com sucesso! "
					sleep 1
				R=1
				elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhuma mensagem adicionada."
					sleep 1
				R=1
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
				R=0
				fi
				done
				echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						cat .celular-tmp | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONT-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "
						sleep 1
					V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
					V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
					V=0
					fi					
					sleep 0.5
					clear
					done	
		I=1
		done
		fi
clear
Principal
}

SMS200() {
	echo ""
	echo -n -e "\e[01;36mInforme o nome da Empresa \"sem espaços\" : \e[00m" ; read EMPRESA
	clear
	echo ""
	echo "A opção informada é 2  :: 200 SMSs ::"
	DATE=$(date "+%T")
	SMS200=200
	cat celular.csv | sed 's/^0\t*//' | sed s/^/55/g > .celular-tmp;
	wc .celular-tmp | awk -F" " '{print $1}' > .celular-tmp1;
	CONT=`cat .celular-tmp1`;
		if [ "$SMS200" -gt "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			echo ""
       			echo "Esta lista possui $CONT linhas, seu arquivo csv possui MENOS de $SMS200 linhas com numero de celulares"
			echo ""
        		read -n4 -a SN -p "Deseja que o programa crie uma lista com MENOS de $SMS200 linhas? s|n "
				if [[ "$SN" == +(s|S|sim|Sim|SIM) ]] ; then 
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					#cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv ;
					#echo ""
                    #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
					echo ""
					read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
					if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						echo ""
						cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv ;
                                        	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
						sleep 1
					Q=1
					
					elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Lista com numeros não criada."
						sleep 1
					Q=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
					Q=0
					fi
					done					
					R=0 ;
					while [ "$R" -eq "0" ] ; do
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then					
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						echo ""
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4 ;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONT-mensagem.csv ;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
					R=1 ;
					
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
					W=1 ;
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
					R=0 ;
					fi
					done
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						echo ""
						sleep 0.5
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "						
						sleep 1
					V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
					V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
					V=0
					fi					
					sleep 0.5
					done
		I=1
				elif [[ "$SN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhum arquivo criado."
					sleep 1
					clear
		I=1				
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
					clear
		I=0
				fi
		done
Principal
                elif [ "$SMS200" -lt "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			echo ""
                      	echo "Esta lista possui $CONT linhas, seu arquivo csv possui MAIS de $SMS200 linhas com numero de celulares."
			echo ""
			read -n4 -a SN -p "Deseja que o programa crie uma lista com MAIS de $SMS200 linhas? s|n "
				if [[ "$SN" == +(s|S|sim|Sim|SIM) ]] ; then
					grep -v "^#" .celular-tmp | sed '/^$/d' | head -499 > .celular-tmp2;
					LISTAHEAD=`cat .celular-tmp2`;
					wc .celular-tmp2 | awk -F" " '{print $1}' > .celular-tmp3;
					CONTLINHAS=`cat .celular-tmp3`;                                        
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					#cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv ;
					#echo ""
                                        #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
					echo ""
					read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
					if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						echo ""
						cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv
                                        	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
						sleep 1
					Q=1
					
					elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Lista com numeros não criada."
						sleep 1
					Q=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
					Q=0
					fi
					done
					R=0
					while [ "$R" -eq "0" ] ; do
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						echo ""
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp2 | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONTLINHAS-mensagem.csv ;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
						R=1
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
					R=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
					R=0
					fi
					done
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 1
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "
						sleep 1
						clear
					V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
						V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
						V=0
					fi					
					sleep 0.5
					done
		I=1
			elif [[ "$SN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
                        	sleep 0.5
				echo "Não ...."
				grep -v "^#" .celular-tmp | sed '/^$/d' | head -200 > .celular-tmp2;
				LISTAHEAD=`cat .celular-tmp2`;
				wc .celular-tmp2 | awk -F" " '{print $1}' > .celular-tmp3;
				CONTLINHAS=`cat .celular-tmp3`;
				#cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv;
				#echo ""
				#echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
					echo ""
					read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
					if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						echo ""
						cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv;
                                        	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
						sleep 1
					Q=1
					
					elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Lista com numeros não criada."
						sleep 1
					Q=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
					Q=0
					fi
					done			
					P=0
					while [ "$P" -eq "0" ] ; do				
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then
						sleep 0.5
						echo "Sim ...."
						echo ""
						sleep 0.5
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp2 | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONTLINHAS-mensagem.csv;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
						P=1
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
						P=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						P=0
					fi
					done					
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "
						sleep 1
						clear
						V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
						V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
						V=0
					fi				
					sleep 0.5
					done
					clear
		I=1
                        else
                                echo ""
				echo "Opção inválida! Vamos tentar novamente ..."
				sleep 1
				clear
		I=0
                        fi		
		done
Principal
                 elif [ "$SMS200" -eq "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			#cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv
			#echo ""
                        #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
			Q=0 ;
			while [ "$Q" -eq "0" ] ; do
				echo ""
				read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
				if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					echo ""
					cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv ;
                                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
					sleep 1
				Q=1
				
				elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Lista com numeros não criada."
					sleep 1
				Q=1
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
				Q=0
				fi
			done
			R=0
			while [ "$R" -eq "0" ] ; do
			echo ""
			read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
				if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then
					sleep 0.5
					echo "Sim ...."
					echo ""
					sleep 0.5
					echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
					cat .celular-tmp | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
					cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONT-mensagem.csv ;
					echo ""
					echo "Mensagem anexada com sucesso! "
					sleep 1
				R=1
				elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhuma mensagem adicionada."
					sleep 1
				R=1
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
				R=0
				fi
				done
				echo ""
				V=0
				while [ "$V" -eq "0" ] ; do
				read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
				if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					cat .celular-tmp | sed 's/$/, /'  > .celular-tmp5;
					cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONT-numero,.csv ;
					echo ""
					echo "Nova lista criada com sucesso! "
					sleep 1
					clear
					V=1
				elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhuma lista criada."
					sleep 1
					clear
					V=1
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
					V=0
				fi					
				sleep 0.5
				clear
				done	
		I=1
		done
		fi
Principal
}

SMS500() {
	echo ""
	echo -n -e "\e[01;36mInforme o nome da Empresa \"sem espaços\" : \e[00m" ; read EMPRESA
	clear
	echo ""
	echo "A opção informada é 3  :: 500 SMSs ::"
	SMS500=500
	cat celular.csv | sed 's/^0\t*//' | sed s/^/55/g > .celular-tmp;
	wc .celular-tmp | awk -F" " '{print $1}' > .celular-tmp1;
	CONT=`cat .celular-tmp1`;
		if [ "$SMS500" -gt "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			echo ""
       			echo "Esta lista possui $CONT linhas, seu arquivo csv possui MENOS de $SMS500 linhas com numero de celulares"
			echo ""
        		read -n4 -a SN -p "Deseja que o programa crie uma lista com MENOS de $SMS500 linhas? s|n "
				if [[ "$SN" == +(s|S|sim|Sim|SIM) ]] ; then 
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					#cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv ;
					#echo ""
                                        #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv ;
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done					
					R=0 ;
					while [ "$R" -eq "0" ] ; do
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then					
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						echo ""
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4 ;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONT-mensagem.csv ;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
					R=1 ;
					
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
					W=1 ;
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
					R=0 ;
					fi
					done
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						echo ""
						sleep 0.5
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "						
						sleep 1
					V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
					V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
					V=0
					fi					
					sleep 0.5
					done
		I=1
				elif [[ "$SN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhum arquivo criado."
					sleep 1
					clear
		I=1				
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
					clear
		I=0
				fi
		done
Principal
                elif [ "$SMS500" -lt "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			echo ""
                      	echo "Esta lista possui $CONT linhas, seu arquivo csv possui MAIS de $SMS500 linhas com numero de celulares."
			echo ""
			read -n4 -a SN -p "Deseja que o programa crie uma lista com MAIS de $SMS500 linhas? s|n "
				if [[ "$SN" == +(s|S|sim|Sim|SIM) ]] ; then
					grep -v "^#" .celular-tmp | sed '/^$/d' | head -999 > .celular-tmp2;
					LISTAHEAD=`cat .celular-tmp2`;
					wc .celular-tmp2 | awk -F" " '{print $1}' > .celular-tmp3;
					CONTLINHAS=`cat .celular-tmp3`;                                        
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					#cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv
					#echo ""
                                        #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done					
					R=0
					while [ "$R" -eq "0" ] ; do
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						echo ""
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp2 | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONTLINHAS-mensagem.csv ;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
						R=1
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
					R=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
					R=0
					fi
					done
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 1
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "
						sleep 1
						clear
					V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
						V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
						V=0
					fi					
					sleep 0.5
					done
		I=1
			elif [[ "$SN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
                        	sleep 0.5
				echo "Não ...."
				grep -v "^#" .celular-tmp | sed '/^$/d' | head -500 > .celular-tmp2;
				LISTAHEAD=`cat .celular-tmp2`;
				wc .celular-tmp2 | awk -F" " '{print $1}' > .celular-tmp3;
				CONTLINHAS=`cat .celular-tmp3`;
				#cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv;
				#echo ""
				#echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv;
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done
					P=0
					while [ "$P" -eq "0" ] ; do				
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then
						sleep 0.5
						echo "Sim ...."
						echo ""
						sleep 0.5
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp2 | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONTLINHAS-mensagem.csv;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
						P=1
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
						P=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						P=0
					fi
					done					
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "
						sleep 1
						clear
						V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
						V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
						V=0
					fi				
					sleep 0.5
					done
					clear
		I=1
                        else
                                echo ""
				echo "Opção inválida! Vamos tentar novamente ..."
				sleep 1
				clear
		I=0
                        fi		
		done
Principal
                 elif [ "$SMS500" -eq "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			#cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv
			#echo ""
                        #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done
			R=0
			while [ "$R" -eq "0" ] ; do
			echo ""
			read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
				if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then
					sleep 0.5
					echo "Sim ...."
					echo ""
					sleep 0.5
					echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
					cat .celular-tmp | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
					cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONT-mensagem.csv ;
					echo ""
					echo "Mensagem anexada com sucesso! "
					sleep 1
				R=1
				elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhuma mensagem adicionada."
					sleep 1
				R=1
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
				R=0
				fi
				done
				echo ""
				V=0
				while [ "$V" -eq "0" ] ; do
				read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
				if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					cat .celular-tmp | sed 's/$/, /'  > .celular-tmp5;
					cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONT-numero,.csv ;
					echo ""
					echo "Nova lista criada com sucesso! "
					sleep 1
					clear
					V=1
				elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhuma lista criada."
					sleep 1
					clear
					V=1
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
					V=0
				fi					
				sleep 0.5
				clear
				done	
		I=1
		done
		fi
Principal
}

SMS1000() {
	echo ""
	echo -n -e "\e[01;36mInforme o nome da Empresa \"sem espaços\" : \e[00m" ; read EMPRESA
	clear
	echo ""
	echo "A opção informada é 4  :: 1000 SMSs ::"
	SMS1000=1000
	cat celular.csv | sed 's/^0\t*//' | sed s/^/55/g > .celular-tmp;
	wc .celular-tmp | awk -F" " '{print $1}' > .celular-tmp1;
	CONT=`cat .celular-tmp1`;
		if [ "$SMS1000" -gt "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			echo ""
       			echo "Esta lista possui $CONT linhas, seu arquivo csv possui MENOS de $SMS1000 linhas com numero de celulares"
			echo ""
        		read -n4 -a SN -p "Deseja que o programa crie uma lista com MENOS de $SMS1000 linhas? s|n "
				if [[ "$SN" == +(s|S|sim|Sim|SIM) ]] ; then 
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					#cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv ;
					#echo ""
                                        #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv ;
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done					
					R=0 ;
					while [ "$R" -eq "0" ] ; do
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then					
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						echo ""
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4 ;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONT-mensagem.csv ;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
					R=1 ;
					
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
					W=1 ;
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
					R=0 ;
					fi
					done
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						echo ""
						sleep 0.5
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "						
						sleep 1
					V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
					V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
					V=0
					fi					
					sleep 0.5
					done
		I=1
				elif [[ "$SN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhum arquivo criado."
					sleep 1
					clear
		I=1				
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
					clear
		I=0
				fi
		done
Principal
                elif [ "$SMS1000" -lt "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			echo ""
                      	echo "Esta lista possui $CONT linhas, seu arquivo csv possui MAIS de $SMS1000 linhas com numero de celulares."
			echo ""
			read -n4 -a SN -p "Deseja que o programa crie uma lista com MAIS de $SMS1000 linhas? s|n "
				if [[ "$SN" == +(s|S|sim|Sim|SIM) ]] ; then
					grep -v "^#" .celular-tmp | sed '/^$/d' | head -2499 > .celular-tmp2;
					LISTAHEAD=`cat .celular-tmp2`;
					wc .celular-tmp2 | awk -F" " '{print $1}' > .celular-tmp3;
					CONTLINHAS=`cat .celular-tmp3`;                                        
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					#cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv
					#echo ""
                                        #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done					
					R=0
					while [ "$R" -eq "0" ] ; do
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						echo ""
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp2 | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONTLINHAS-mensagem.csv ;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
						R=1
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
					R=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
					R=0
					fi
					done
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 1
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "
						sleep 1
						clear
					V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
						V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
						V=0
					fi					
					sleep 0.5
					done
		I=1
			elif [[ "$SN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
                        	sleep 0.5
				echo "Não ...."
				grep -v "^#" .celular-tmp | sed '/^$/d' | head -1000 > .celular-tmp2;
				LISTAHEAD=`cat .celular-tmp2`;
				wc .celular-tmp2 | awk -F" " '{print $1}' > .celular-tmp3;
				CONTLINHAS=`cat .celular-tmp3`;
				#cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv;
				#echo ""
				#echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv;
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done
					P=0
					while [ "$P" -eq "0" ] ; do				
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then
						sleep 0.5
						echo "Sim ...."
						echo ""
						sleep 0.5
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp2 | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONTLINHAS-mensagem.csv;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
						P=1
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
						P=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						P=0
					fi
					done					
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "
						sleep 1
						clear
						V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
						V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
						V=0
					fi				
					sleep 0.5
					done
					clear
		I=1
                        else
                                echo ""
				echo "Opção inválida! Vamos tentar novamente ..."
				sleep 1
				clear
		I=0
                        fi		
		done
Principal
                 elif [ "$SMS1000" -eq "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			#cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv
			#echo ""
                        #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done			
			R=0
			while [ "$R" -eq "0" ] ; do
			echo ""
			read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
				if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then
					sleep 0.5
					echo "Sim ...."
					echo ""
					sleep 0.5
					echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
					cat .celular-tmp | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
					cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONT-mensagem.csv ;
					echo ""
					echo "Mensagem anexada com sucesso! "
					sleep 1
				R=1
				elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhuma mensagem adicionada."
					sleep 1
				R=1
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
				R=0
				fi
				done
				echo ""
				V=0
				while [ "$V" -eq "0" ] ; do
				read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
				if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					cat .celular-tmp | sed 's/$/, /'  > .celular-tmp5;
					cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONT-numero,.csv ;
					echo ""
					echo "Nova lista criada com sucesso! "
					sleep 1
					clear
					V=1
				elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhuma lista criada."
					sleep 1
					clear
					V=1
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
					V=0
				fi					
				sleep 0.5
				clear
				done	
		I=1
		done
		fi
Principal
}

SMS2500() {
	echo ""
	echo -n -e "\e[01;36mInforme o nome da Empresa \"sem espaços\" : \e[00m" ; read EMPRESA
	clear
	echo ""
	echo "A opção informada é 5  :: 2500 SMSs ::"
	SMS2500=2500
	cat celular.csv | sed 's/^0\t*//' | sed s/^/55/g > .celular-tmp;
	wc .celular-tmp | awk -F" " '{print $1}' > .celular-tmp1;
	CONT=`cat .celular-tmp1`;
		if [ "$SMS2500" -gt "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			echo ""
       			echo "Esta lista possui $CONT linhas, seu arquivo csv possui MENOS de $SMS2500 linhas com numero de celulares"
			echo ""
        		read -n4 -a SN -p "Deseja que o programa crie uma lista com MENOS de $SMS2500 linhas? s|n "
				if [[ "$SN" == +(s|S|sim|Sim|SIM) ]] ; then 
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					#cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv ;
					#echo ""
                                        #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv ;
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done
					R=0 ;
					while [ "$R" -eq "0" ] ; do
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then					
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						echo ""
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4 ;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONT-mensagem.csv ;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
					R=1 ;
					
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
					W=1 ;
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
					R=0 ;
					fi
					done
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						echo ""
						sleep 0.5
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "						
						sleep 1
					V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
					V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
					V=0
					fi					
					sleep 0.5
					done
		I=1
				elif [[ "$SN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhum arquivo criado."
					sleep 1
					clear
		I=1				
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
					clear
		I=0
				fi
		done
Principal
                elif [ "$SMS2500" -lt "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			echo ""
                      	echo "Esta lista possui $CONT linhas, seu arquivo csv possui MAIS de $SMS2500 linhas com numero de celulares."
			echo ""
			read -n4 -a SN -p "Deseja que o programa crie uma lista com MAIS de $SMS2500 linhas? s|n "
				if [[ "$SN" == +(s|S|sim|Sim|SIM) ]] ; then
					grep -v "^#" .celular-tmp | sed '/^$/d' | head -4999 > .celular-tmp2;
					LISTAHEAD=`cat .celular-tmp2`;
					wc .celular-tmp2 | awk -F" " '{print $1}' > .celular-tmp3;
					CONTLINHAS=`cat .celular-tmp3`;                                        
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					#cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv
					#echo ""
                                        #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done
					R=0
					while [ "$R" -eq "0" ] ; do
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						echo ""
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp2 | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONTLINHAS-mensagem.csv ;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
						R=1
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
					R=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
					R=0
					fi
					done
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 1
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "
						sleep 1
						clear
					V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
						V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
						V=0
					fi					
					sleep 0.5
					done
		I=1
			elif [[ "$SN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
                        	sleep 0.5
				echo "Não ...."
				grep -v "^#" .celular-tmp | sed '/^$/d' | head -2500 > .celular-tmp2;
				LISTAHEAD=`cat .celular-tmp2`;
				wc .celular-tmp2 | awk -F" " '{print $1}' > .celular-tmp3;
				CONTLINHAS=`cat .celular-tmp3`;
				#cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv;
				#echo ""
				#echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv;
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done		
					P=0
					while [ "$P" -eq "0" ] ; do				
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then
						sleep 0.5
						echo "Sim ...."
						echo ""
						sleep 0.5
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp2 | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONTLINHAS-mensagem.csv;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
						P=1
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
						P=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						P=0
					fi
					done					
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "
						sleep 1
						clear
						V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
						V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
						V=0
					fi				
					sleep 0.5
					done
					clear
		I=1
                        else
                                echo ""
				echo "Opção inválida! Vamos tentar novamente ..."
				sleep 1
				clear
		I=0
                        fi		
		done
Principal
                 elif [ "$SMS2500" -eq "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			#cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv
			#echo ""
                        #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done
			R=0
			while [ "$R" -eq "0" ] ; do
			echo ""
			read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
				if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then
					sleep 0.5
					echo "Sim ...."
					echo ""
					sleep 0.5
					echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
					cat .celular-tmp | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
					cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONT-mensagem.csv ;
					echo ""
					echo "Mensagem anexada com sucesso! "
					sleep 1
				R=1
				elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhuma mensagem adicionada."
					sleep 1
				R=1
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
				R=0
				fi
				done
				echo ""
				V=0
				while [ "$V" -eq "0" ] ; do
				read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
				if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					cat .celular-tmp | sed 's/$/, /'  > .celular-tmp5;
					cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONT-numero,.csv ;
					echo ""
					echo "Nova lista criada com sucesso! "
					sleep 1
					clear
					V=1
				elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhuma lista criada."
					sleep 1
					clear
					V=1
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
					V=0
				fi					
				sleep 0.5
				clear
				done	
		I=1
		done
		fi
Principal
}

SMS5000() {
	echo ""
	echo -n -e "\e[01;36mInforme o nome da Empresa \"sem espaços\" : \e[00m" ; read EMPRESA
	clear
	echo ""
	echo "A opção informada é 6  :: 5000 SMSs ::"
	SMS5000=5000
	cat celular.csv | sed 's/^0\t*//' | sed s/^/55/g > .celular-tmp;
	wc .celular-tmp | awk -F" " '{print $1}' > .celular-tmp1;
	CONT=`cat .celular-tmp1`;
		if [ "$SMS5000" -gt "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			echo ""
       			echo "Esta lista possui $CONT linhas, seu arquivo csv possui MENOS de $SMS5000 linhas com numero de celulares"
			echo ""
        		read -n4 -a SN -p "Deseja que o programa crie uma lista com MENOS de $SMS5000 linhas? s|n "
				if [[ "$SN" == +(s|S|sim|Sim|SIM) ]] ; then 
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					#cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv ;
					#echo ""
                                        #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv ;
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done
					R=0 ;
					while [ "$R" -eq "0" ] ; do
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then					
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						echo ""
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4 ;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONT-mensagem.csv ;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
					R=1 ;
					
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
					W=1 ;
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
					R=0 ;
					fi
					done
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						echo ""
						sleep 0.5
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "						
						sleep 1
					V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
					V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
					V=0
					fi					
					sleep 0.5
					done
		I=1
				elif [[ "$SN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhum arquivo criado."
					sleep 1
					clear
		I=1				
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
					clear
		I=0
				fi
		done
Principal
                elif [ "$SMS5000" -lt "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			echo ""
                      	echo "Esta lista possui $CONT linhas, seu arquivo csv possui MAIS de $SMS5000 linhas com numero de celulares."
			echo ""
			read -n4 -a SN -p "Deseja que o programa crie uma lista com MAIS de $SMS5000 linhas? s|n "
				if [[ "$SN" == +(s|S|sim|Sim|SIM) ]] ; then
					grep -v "^#" .celular-tmp | sed '/^$/d' | head -9999 > .celular-tmp2;
					LISTAHEAD=`cat .celular-tmp2`;
					wc .celular-tmp2 | awk -F" " '{print $1}' > .celular-tmp3;
					CONTLINHAS=`cat .celular-tmp3`;                                        
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					#cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv
					#echo ""
                                        #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done
					R=0
					while [ "$R" -eq "0" ] ; do
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						echo ""
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp2 | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONTLINHAS-mensagem.csv ;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
						R=1
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
					R=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
					R=0
					fi
					done
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 1
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "
						sleep 1
						clear
					V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
						V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
						V=0
					fi					
					sleep 0.5
					done
		I=1
			elif [[ "$SN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
                        	sleep 0.5
				echo "Não ...."
				grep -v "^#" .celular-tmp | sed '/^$/d' | head -5000 > .celular-tmp2;
				LISTAHEAD=`cat .celular-tmp2`;
				wc .celular-tmp2 | awk -F" " '{print $1}' > .celular-tmp3;
				CONTLINHAS=`cat .celular-tmp3`;
				#cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv;
				#echo ""
				#echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv;
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done
					P=0
					while [ "$P" -eq "0" ] ; do				
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then
						sleep 0.5
						echo "Sim ...."
						echo ""
						sleep 0.5
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp2 | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONTLINHAS-mensagem.csv;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
						P=1
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
						P=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						P=0
					fi
					done					
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "
						sleep 1
						clear
						V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
						V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
						V=0
					fi				
					sleep 0.5
					done
					clear
		I=1
                        else
                                echo ""
				echo "Opção inválida! Vamos tentar novamente ..."
				sleep 1
				clear
		I=0
                        fi		
		done
Principal
                 elif [ "$SMS5000" -eq "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			#cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv
			#echo ""
                        #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done
			R=0
			while [ "$R" -eq "0" ] ; do
			echo ""
			read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
				if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then
					sleep 0.5
					echo "Sim ...."
					echo ""
					sleep 0.5
					echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
					cat .celular-tmp | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
					cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONT-mensagem.csv ;
					echo ""
					echo "Mensagem anexada com sucesso! "
					sleep 1
				R=1
				elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhuma mensagem adicionada."
					sleep 1
				R=1
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
				R=0
				fi
				done
				echo ""
				V=0
				while [ "$V" -eq "0" ] ; do
				read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
				if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					cat .celular-tmp | sed 's/$/, /'  > .celular-tmp5;
					cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONT-numero,.csv ;
					echo ""
					echo "Nova lista criada com sucesso! "
					sleep 1
					clear
					V=1
				elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhuma lista criada."
					sleep 1
					clear
					V=1
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
					V=0
				fi					
				sleep 0.5
				clear
				done	
		I=1
		done
		fi
Principal
}

SMS10000() {
	echo ""
	echo -n -e "\e[01;36mInforme o nome da Empresa \"sem espaços\" : \e[00m" ; read EMPRESA
	clear
	echo ""
	echo "A opção informada é 7  :: 10000 SMSs ::"
	SMS10000=10000
	cat celular.csv | sed 's/^0\t*//' | sed s/^/55/g > .celular-tmp;
	wc .celular-tmp | awk -F" " '{print $1}' > .celular-tmp1;
	CONT=`cat .celular-tmp1`;
		if [ "$SMS10000" -gt "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			echo ""
       			echo "Esta lista possui $CONT linhas, seu arquivo csv possui MENOS de $SMS10000 linhas com numero de celulares"
			echo ""
        		read -n4 -a SN -p "Deseja que o programa crie uma lista com MENOS de $SMS10000 linhas? s|n "
				if [[ "$SN" == +(s|S|sim|Sim|SIM) ]] ; then 
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					#cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv ;
					#echo ""
                                        #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv ;
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done
					R=0 ;
					while [ "$R" -eq "0" ] ; do
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then					
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						echo ""
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4 ;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONT-mensagem.csv ;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
					R=1 ;
					
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
					W=1 ;
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
					R=0 ;
					fi
					done
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						echo ""
						sleep 0.5
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "						
						sleep 1
					V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
					V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
					V=0
					fi					
					sleep 0.5
					done
		I=1
				elif [[ "$SN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhum arquivo criado."
					sleep 1
					clear
		I=1				
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
					clear
		I=0
				fi
		done
Principal
                elif [ "$SMS10000" -lt "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			echo ""
                      	echo "Esta lista possui $CONT linhas, seu arquivo csv possui MAIS de $SMS10000 linhas com numero de celulares."
			echo ""
			read -n4 -a SN -p "Deseja que o programa crie uma lista com MAIS de $SMS10000 linhas? s|n "
				if [[ "$SN" == +(s|S|sim|Sim|SIM) ]] ; then
					grep -v "^#" .celular-tmp | sed '/^$/d' | head -19999 > .celular-tmp2;
					LISTAHEAD=`cat .celular-tmp2`;
					wc .celular-tmp2 | awk -F" " '{print $1}' > .celular-tmp3;
					CONTLINHAS=`cat .celular-tmp3`;                                        
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					#cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv
					#echo ""
                                        #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done
					R=0
					while [ "$R" -eq "0" ] ; do
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						echo ""
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp2 | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONTLINHAS-mensagem.csv ;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
						R=1
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
					R=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
					R=0
					fi
					done
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 1
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "
						sleep 1
						clear
					V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
						V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
						V=0
					fi					
					sleep 0.5
					done
		I=1
			elif [[ "$SN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
                        	sleep 0.5
				echo "Não ...."
				grep -v "^#" .celular-tmp | sed '/^$/d' | head -10000 > .celular-tmp2;
				LISTAHEAD=`cat .celular-tmp2`;
				wc .celular-tmp2 | awk -F" " '{print $1}' > .celular-tmp3;
				CONTLINHAS=`cat .celular-tmp3`;
				#cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv;
				#echo ""
				#echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv;
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done
					P=0
					while [ "$P" -eq "0" ] ; do				
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then
						sleep 0.5
						echo "Sim ...."
						echo ""
						sleep 0.5
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp2 | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONTLINHAS-mensagem.csv;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
						P=1
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
						P=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						P=0
					fi
					done					
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "
						sleep 1
						clear
						V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
						V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
						V=0
					fi				
					sleep 0.5
					done
					clear
		I=1
                        else
                                echo ""
				echo "Opção inválida! Vamos tentar novamente ..."
				sleep 1
				clear
		I=0
                        fi		
		done
Principal
                 elif [ "$SMS10000" -eq "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			#cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv
			#echo ""
                        #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done
			R=0
			while [ "$R" -eq "0" ] ; do
			echo ""
			read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
				if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then
					sleep 0.5
					echo "Sim ...."
					echo ""
					sleep 0.5
					echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
					cat .celular-tmp | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
					cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONT-mensagem.csv ;
					echo ""
					echo "Mensagem anexada com sucesso! "
					sleep 1
				R=1
				elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhuma mensagem adicionada."
					sleep 1
				R=1
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
				R=0
				fi
				done
				echo ""
				V=0
				while [ "$V" -eq "0" ] ; do
				read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
				if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					cat .celular-tmp | sed 's/$/, /'  > .celular-tmp5;
					cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONT-numero,.csv ;
					echo ""
					echo "Nova lista criada com sucesso! "
					sleep 1
					clear
					V=1
				elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhuma lista criada."
					sleep 1
					clear
					V=1
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
					V=0
				fi					
				sleep 0.5
				clear
				done	
		I=1
		done
		fi
Principal
}

SMS20000() {
	echo ""
	echo -n -e "\e[01;36mInforme o nome da Empresa \"sem espaços\" : \e[00m" ; read EMPRESA
	clear
	echo ""
	echo "A opção informada é 8  :: 20000 SMSs ::"
	SMS20000=20000
	cat celular.csv | sed 's/^0\t*//' | sed s/^/55/g > .celular-tmp;
	wc .celular-tmp | awk -F" " '{print $1}' > .celular-tmp1;
	CONT=`cat .celular-tmp1`;
		if [ "$SMS20000" -gt "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			echo ""
       			echo "Esta lista possui $CONT linhas, seu arquivo csv possui MENOS de $SMS20000 linhas com numero de celulares"
			echo ""
        		read -n4 -a SN -p "Deseja que o programa crie uma lista com MENOS de $SMS20000 linhas? s|n "
				if [[ "$SN" == +(s|S|sim|Sim|SIM) ]] ; then 
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					#cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv ;
					#echo ""
                                        #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv ;
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done
					R=0 ;
					while [ "$R" -eq "0" ] ; do
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then					
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						echo ""
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4 ;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONT-mensagem.csv ;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
					R=1 ;
					
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
					W=1 ;
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
					R=0 ;
					fi
					done
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						echo ""
						sleep 0.5
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "						
						sleep 1
					V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
					V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
					V=0
					fi					
					sleep 0.5
					done
		I=1
				elif [[ "$SN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhum arquivo criado."
					sleep 1
					clear
		I=1				
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
					clear
		I=0
				fi
		done
Principal
                elif [ "$SMS20000" -lt "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			echo ""
                      	echo "Esta lista possui $CONT linhas, seu arquivo csv possui MAIS de $SMS20000 linhas com numero de celulares."
			echo ""
			read -n4 -a SN -p "Deseja que o programa crie uma lista com MAIS de $SMS20000 linhas? s|n "
				if [[ "$SN" == +(s|S|sim|Sim|SIM) ]] ; then
					grep -v "^#" .celular-tmp | sed '/^$/d' | head -49999 > .celular-tmp2;
					LISTAHEAD=`cat .celular-tmp2`;
					wc .celular-tmp2 | awk -F" " '{print $1}' > .celular-tmp3;
					CONTLINHAS=`cat .celular-tmp3`;                                        
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					#cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv
					#echo ""
                                        #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done
					R=0
					while [ "$R" -eq "0" ] ; do
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						echo ""
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp2 | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONTLINHAS-mensagem.csv ;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
						R=1
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
					R=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
					R=0
					fi
					done
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 1
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "
						sleep 1
						clear
					V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
						V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
						V=0
					fi					
					sleep 0.5
					done
		I=1
			elif [[ "$SN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
                        	sleep 0.5
				echo "Não ...."
				grep -v "^#" .celular-tmp | sed '/^$/d' | head -20000 > .celular-tmp2;
				LISTAHEAD=`cat .celular-tmp2`;
				wc .celular-tmp2 | awk -F" " '{print $1}' > .celular-tmp3;
				CONTLINHAS=`cat .celular-tmp3`;
				#cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv;
				#echo ""
				#echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv;
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done
					P=0
					while [ "$P" -eq "0" ] ; do				
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then
						sleep 0.5
						echo "Sim ...."
						echo ""
						sleep 0.5
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp2 | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONTLINHAS-mensagem.csv;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
						P=1
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
						P=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						P=0
					fi
					done					
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "
						sleep 1
						clear
						V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
						V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
						V=0
					fi				
					sleep 0.5
					done
					clear
		I=1
                        else
                                echo ""
				echo "Opção inválida! Vamos tentar novamente ..."
				sleep 1
				clear
		I=0
                        fi		
		done
Principal
                 elif [ "$SMS20000" -eq "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			#cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv
			#echo ""
                        #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done
			R=0
			while [ "$R" -eq "0" ] ; do
			echo ""
			read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
				if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then
					sleep 0.5
					echo "Sim ...."
					echo ""
					sleep 0.5
					echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
					cat .celular-tmp | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
					cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONT-mensagem.csv ;
					echo ""
					echo "Mensagem anexada com sucesso! "
					sleep 1
				R=1
				elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhuma mensagem adicionada."
					sleep 1
				R=1
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
				R=0
				fi
				done
				echo ""
				V=0
				while [ "$V" -eq "0" ] ; do
				read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
				if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					cat .celular-tmp | sed 's/$/, /'  > .celular-tmp5;
					cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONT-numero,.csv ;
					echo ""
					echo "Nova lista criada com sucesso! "
					sleep 1
					clear
					V=1
				elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhuma lista criada."
					sleep 1
					clear
					V=1
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
					V=0
				fi					
				sleep 0.5
				clear
				done	
		I=1
		done
		fi
Principal
}

SMS50000() {
	echo ""
	echo -n -e "\e[01;36mInforme o nome da Empresa \"sem espaços\" : \e[00m" ; read EMPRESA
	clear
	echo ""
	echo "A opção informada é 9  :: 50000 SMSs ::"
	SMS50000=50000
	cat celular.csv | sed 's/^0\t*//' | sed s/^/55/g > .celular-tmp;
	wc .celular-tmp | awk -F" " '{print $1}' > .celular-tmp1;
	CONT=`cat .celular-tmp1`;
		if [ "$SMS50000" -gt "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			echo ""
       			echo "Esta lista possui $CONT linhas, seu arquivo csv possui MENOS de $SMS50000 linhas com numero de celulares"
			echo ""
        		read -n4 -a SN -p "Deseja que o programa crie uma lista com MENOS de $SMS50000 linhas? s|n "
				if [[ "$SN" == +(s|S|sim|Sim|SIM) ]] ; then 
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					#cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv ;
					#echo ""
                                        #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv ;
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done
					R=0 ;
					while [ "$R" -eq "0" ] ; do
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then					
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						echo ""
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4 ;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONT-mensagem.csv ;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
					R=1 ;
					
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
					W=1 ;
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
					R=0 ;
					fi
					done
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						echo ""
						sleep 0.5
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "						
						sleep 1
					V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
					V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
					V=0
					fi					
					sleep 0.5
					done
		I=1
				elif [[ "$SN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhum arquivo criado."
					sleep 1
					clear
		I=1				
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
					clear
		I=0
				fi
		done
Principal
                elif [ "$SMS50000" -lt "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			echo ""
                      	echo "Esta lista possui $CONT linhas, seu arquivo csv possui MAIS de $SMS50000 linhas com numero de celulares."
			echo ""
			read -n4 -a SN -p "Deseja que o programa crie uma lista com MAIS de $SMS50000 linhas? s|n "
				if [[ "$SN" == +(s|S|sim|Sim|SIM) ]] ; then
					grep -v "^#" .celular-tmp | sed '/^$/d' | head -70000 > .celular-tmp2;
					LISTAHEAD=`cat .celular-tmp2`;
					wc .celular-tmp2 | awk -F" " '{print $1}' > .celular-tmp3;
					CONTLINHAS=`cat .celular-tmp3`;                                        
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					#cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv
					#echo ""
                                        #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done
					R=0
					while [ "$R" -eq "0" ] ; do
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						echo ""
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp2 | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONTLINHAS-mensagem.csv ;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
						R=1
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
					R=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
					R=0
					fi
					done
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 1
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "
						sleep 1
						clear
					V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
						V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
						V=0
					fi					
					sleep 0.5
					done
		I=1
			elif [[ "$SN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
                        	sleep 0.5
				echo "Não ...."
				grep -v "^#" .celular-tmp | sed '/^$/d' | head -50000 > .celular-tmp2;
				LISTAHEAD=`cat .celular-tmp2`;
				wc .celular-tmp2 | awk -F" " '{print $1}' > .celular-tmp3;
				CONTLINHAS=`cat .celular-tmp3`;
				#cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv;
				#echo ""
				#echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp2 > $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv;
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONTLINHAS-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done
					P=0
					while [ "$P" -eq "0" ] ; do				
					echo ""
					read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
					if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then
						sleep 0.5
						echo "Sim ...."
						echo ""
						sleep 0.5
						echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
						cat .celular-tmp2 | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
						cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONTLINHAS-mensagem.csv;
						echo ""
						echo "Mensagem anexada com sucesso! "
						sleep 1
						P=1
					elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma mensagem adicionada."
						sleep 1
						P=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						P=0
					fi
					done					
					echo ""
					V=0
					while [ "$V" -eq "0" ] ; do
					read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
					if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
						sleep 0.5
						echo "Sim ...."
						sleep 0.5
						cat .celular-tmp2 | sed 's/$/, /'  > .celular-tmp5;
						cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONTLINHAS-numero,.csv ;
						echo ""
						echo "Nova lista criada com sucesso! "
						sleep 1
						clear
						V=1
					elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
						sleep 0.5
						echo "Não ...."
						echo ""
						sleep 0.5
						echo "Nenhuma lista criada."
						sleep 1
						clear
						V=1
					else
						echo ""
						echo "Opção inválida! Vamos tentar novamente ..."
						sleep 1
						echo ""
						V=0
					fi				
					sleep 0.5
					done
					clear
		I=1
                        else
                                echo ""
				echo "Opção inválida! Vamos tentar novamente ..."
				sleep 1
				clear
		I=0
                        fi		
		done
Principal
                 elif [ "$SMS50000" -eq "$CONT" ] ; then
			I=0
			while [ "$I" -eq "0" ] ; do
			#cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv
			#echo ""
                        #echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
					Q=0 ;
					while [ "$Q" -eq "0" ] ; do
						echo ""
						read -a LIST -p "Deseja que o programa crie uma lista de celular formato: ( numero ) s|n "
						if [[ "$LIST" == +(s|S|sim|Sim|SIM) ]] ; then					
							sleep 0.5
							echo "Sim ...."
							sleep 0.5
							echo ""
							cat .celular-tmp > $EMPRESA-$DATE-com-$CONT-numeros.csv
				                       	echo "Arquivo com o nome: $EMPRESA-$DATE-com-$CONT-numeros.csv criado com sucesso!"
							sleep 1
						Q=1
				
						elif [[ "$LIST" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
							sleep 0.5
							echo "Não ...."
							echo ""
							sleep 0.5
							echo "Lista com numeros não criada."
							sleep 1
						Q=1
						else
							echo ""
							echo "Opção inválida! Vamos tentar novamente ..."
							sleep 1
						Q=0
						fi
					done
			R=0
			while [ "$R" -eq "0" ] ; do
			echo ""
			read -a SOUN -p "Deseja incluir uma mensagem aos numeros de celular? Formato ( numero, mensagem ) s|n "
				if [[ "$SOUN" == +(s|S|sim|Sim|SIM) ]] ; then
					sleep 0.5
					echo "Sim ...."
					echo ""
					sleep 0.5
					echo -n "Digite a mensagem a ser anexada ( sem virgula ): " ; read MENSAGEM
					cat .celular-tmp | sed 's/$/, /' | sed "s/$/$MENSAGEM/" > .celular-tmp4;
					cat .celular-tmp4 > $EMPRESA-$DATE-com-$CONT-mensagem.csv ;
					echo ""
					echo "Mensagem anexada com sucesso! "
					sleep 1
				R=1
				elif [[ "$SOUN" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhuma mensagem adicionada."
					sleep 1
				R=1
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
				R=0
				fi
				done
				echo ""
				V=0
				while [ "$V" -eq "0" ] ; do
				read -a SNV -p "Deseja criar outra lista com vírgula aos numeros de celular? Formato ( numero, ) s|n "
				if [[ "$SNV" == +(s|S|sim|Sim|SIM) ]] ; then 
					sleep 0.5
					echo "Sim ...."
					sleep 0.5
					cat .celular-tmp | sed 's/$/, /'  > .celular-tmp5;
					cat .celular-tmp5 > $EMPRESA-$DATE-com-$CONT-numero,.csv ;
					echo ""
					echo "Nova lista criada com sucesso! "
					sleep 1
					clear
					V=1
				elif [[ "$SNV" == +(n|N|nao|Nao|NAO|Não|NÃO) ]] ; then
					sleep 0.5
					echo "Não ...."
					echo ""
					sleep 0.5
					echo "Nenhuma lista criada."
					sleep 1
					clear
					V=1
				else
					echo ""
					echo "Opção inválida! Vamos tentar novamente ..."
					sleep 1
					V=0
				fi					
				sleep 0.5
				clear
				done	
		I=1
		done
		fi
}
Principal
