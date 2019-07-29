#!/bin/bash
#!/bin/sh

#Version :1.0
#Purpose : K8sMaster_install_script
#Author : Prabhu Raja Singh.D

############################################################################################
magenta='\033[0;35m'
bold=$(tput bold)
normal=$(tput sgr0)
GREEN='\033[0;32m'
RED='\033[0;31m'
yellow='\033[0;33m'
NC='\033[0m' # No Color
#############################################################################################

rm -rf ./logs/k8smaster_config.log

exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>./logs/k8smaster_config.log 2>&1

echo "Step 1: Configuring Kubernetes Master"

sleep 2s

kubeadm init --pod-network-cidr=10.244.0.0/16

echo -e "\\n\\n${RED}${bold}Please note above last line which starts with "kubeadm join" and save it is some place then run it in all kubernetes node servers after the install.sh ${normal}${NC}.\\n\\n"

sleep 10s

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

cd ./app/flannel && kubectl apply -f kube-flannel.yml

kubectl get nodes



