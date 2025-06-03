#!/bin/bash
#mostrar banner el script con estilo
echo -e "\e[34m"
cat << "EOF"
 ________ __              ________                                                            __
|        |  \            |        \                                                          |  \
| $$$$$$$| $$            | $$$$$$$$ _______  _______ ______  _______   ______   ______   ____| $$ ______   ______
| $$__   | $$            | $$__    /       \/       |      \|       \ /      \ |      \ /      $$/      \ /      \
| $$  \  | $$            | $$  \  |  $$$$$$|  $$$$$$$\$$$$$$| $$$$$$$|  $$$$$$\ \$$$$$$|  $$$$$$|  $$$$$$|  $$$$$$\
| $$$$$  | $$            | $$$$$   \$$    \| $$     /      $| $$  | $| $$    $$/      $| $$  | $| $$  | $| $$   \$$
| $$_____| $$_____       | $$_____ _\$$$$$$| $$____|  $$$$$$| $$  | $| $$$$$$$|  $$$$$$| $$__| $| $$__/ $| $$
| $$     | $$     \      | $$     |       $$\$$     \$$    $| $$  | $$\$$     \\$$    $$\$$    $$\$$    $| $$
 \$$$$$$$$\$$$$$$$$       \$$$$$$$$\$$$$$$$  \$$$$$$$\$$$$$$$\$$   \$$ \$$$$$$$ \$$$$$$$ \$$$$$$$ \$$$$$$ \$$

V0-by-MCF-rooted


EOF
echo -e "\e[0m"

#Primero pide parametro del dominio 
echo "Introduzca un dominio"
Dominios="${1}"

echo "Dominio escrito: ${Dominios}"

subfinder -d "${Dominios}" -silent > subdominiosNodeterminados.txt   #Analizo los posibles subdominios que tenga el dominio principal
echo "Aplicando HTTPX en ${Dominios}"

Numero_de_subdominios=$(wc -l subdominiosNodeterminados.txt | cut -d ' ' -f 1) #variable que servira para determinar el numero de subdominios en la lista 

#Recorrer la lista y verificar si tiene codigo 200 con httpx
for index in $(seq 1 $Numero_de_subdominios); do
subdominios=$(sed -n "${index}p" subdominiosNodeterminados.txt)
#echo "subdominio: ${subdominios}"

resultado=$(httpx --follow-redirects "https://${subdominios}" | grep HTTP) #variable que guarda el resultado de httpx usando grep

	if [[ $resultado =~ "200" ]]
	then #El error es marcado aca, posiblemente es por culpa del condicional "[[: command not found"
	       echo -e "\e[32m[✔] $subdominios --> $resultado \e[0m"
       else 
		echo -e "\e[31m[✖] $subdominios ---> [subdominio sin respuesta] \e[0m"
 	fi		
done

#Continuara...
