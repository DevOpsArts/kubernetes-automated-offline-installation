#!/bin/bash
#!/bin/sh

#Version :1.0
#Purpose : Kubernetes_install_script
#Date: 29/07/2019
#Author : Prabhu Raja Singh.D
#############################################################################################
magenta='\033[0;35m'
bold=$(tput bold)
normal=$(tput sgr0)
GREEN='\033[0;32m'
RED='\033[0;31m'
yellow='\033[0;33m'
NC='\033[0m' # No Color
#############################################################################################
#clear logs
sh ./scripts/clean.sh
############################################################################################
setram=4000 #MB
setcpu=2 #Core

printf '%100s\n' | tr ' ' =

echo -e "${magenta}${bold}Welcome to Kubernetes Cluster Offline installation.!!!${normal}${NC}\\n\\n"

echo -e "\\n\\nNote : ${yellow}Please run this setup.sh in ${bold}root${normal} ${yellow}user.${NC}"


printf '%100s\n' | tr ' ' =
echo -e "\\nChecking server available resources to deploy:\\n"

free -m|head -n2|tail -n1|awk '{print $2}' > ./scripts/files/memcount.txt
grep -c ^processor /proc/cpuinfo > ./scripts/files/cpu.txt

ram=$(cat ./scripts/files/memcount.txt)
cpu=$(cat ./scripts/files/cpu.txt)

if [ "$ram" -ge "$setram" ] && [ "$cpu" -ge "$setcpu" ] ; then

echo -e "\\nThis server has enough resources to install Kubernetes,Proceeding further installations.\\n\\n"

printf '%100s\n' | tr ' ' =
#sleep 5s

echo -e "Updating system changes for setup:\\n\\n"
sh ./scripts/K8Spresetup.sh
printf '%100s\n' | tr ' ' =

else

echo -e "${RED}${bold}This server is not having enough resources to deploy Kubernetes,Please assign min.$setcpu Core,$setram MB RAM to this server then run this setup!!!${normal}${NC}"
printf '%100s\n' | tr ' ' =

fi
