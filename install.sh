#!/bin/bash
#!/bin/sh

#Version :1.0
#Purpose : Kubernetes_install_script
#Date: 09/04/2019
#Author : Prabhu Raja Singh.D
#############################################################################################
swapoff -a

blink='\033[0;5m'
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
#############################################################################################

printf '%100s\n' | tr ' ' =

echo -e "${magenta}${bold}Welcome back to Kubernetes Offline Autoinstall Setup!!!${normal}${NC}\\n\\n"

echo -e "\\n\\nNote : ${yellow}Please run this install.sh in ${bold}root${normal} ${yellow}user.${NC}"

printf '%100s\n' | tr ' ' =

echo -e "Did you run setup.sh in this server? (y/n)."

read continue

if [ "$continue" = "y" ] ; then

echo -e "\\n\\nThis is your Kubernetes Master Server? if yes then type y for YES to proceed further or n for NO to proceed for Kuberntes Node Server setup (y/n)."

read continue

if [ "$continue" = "y" ] ; then

echo -e "\\n\\nInstalling and configuring Kubernetes Master packages.Estimated approx. time for installation is, 10 mins.\\n\\n"
echo -ne "[Installing K8s: Approx. 10 mins] Installing [################                                              (30%)]\r"
sh ./scripts/setup_master.sh
sleep 1m


echo -e "\\n\\n${RED}${bold}Please join the K8s node servers,kubeadm join command is located in K8sMaster extracted root directory. File name:k8snodeconfig.txt or copy the below lines in Node servers${normal}${NC}\\n\\n"

echo -e "\\n\\n"
cat k8snodeconfig.txt

echo -e "\\n\\n"

echo -e "\\n\\nDid you run kubeadm join command in all node servers?(y)"

read continue

if [ "$continue" = "y" ] ; then

echo -e "\\n\\nChecking K8s nodes status,\\n"
sleep 1s

kubectl get nodes

sleep 2s
echo -e "\\n\\n"


echo -e "\\n\\nK8s Installation and configuration is completed.\\n\\n"
printf '%100s\n' | tr ' ' =

echo -e "\\n\\nValidating the installation status,It will take approx. 2 mins. and it will show the results below,Please check all status should be running/completed\\n\\n"

echo -ne "[Validation: Approx. 2 mins] Validating [######################################################        (95%)]\r"

sleep 1m
sh ./scripts/verification.sh
echo -e "\\n\\n"
echo -ne "Installations Completed [################################################################################(100%)]\r"

printf '%100s\n' | tr ' ' =

else

echo -e "\\n\\nJoin K8s node server, then run install.sh.!!! kubeadm Join command is located in K8sMaster extracted root directory. File name:k8snodeconfig.txt\\n\\"
printf '%100s\n' | tr ' ' =
fi

else

echo -e "\\n\\nInstalling K8s node server applications, Estimated approx. time for installation is, 10 mins.\\n\\n "
echo -ne "[Installing K8s Node: Approx. 10 mins] Installing [####                                     (20%)]\r"
sh ./scripts/setup_node.sh

echo -ne "Completed [################################################################################(100%)]\r"
echo -e "\\n\\nK8s,Docker Installed in this server successfully,Please start K8s installation in Master Server.\\n"

printf '%100s\n' | tr ' ' =
fi

else

echo -e "\\n${RED}${bold}Please run setup.sh and run install.sh ${normal} ${NC}\\n"

printf '%100s\n' | tr ' ' =


fi
