#!/bin/bash
#!/bin/sh

#Version :1.0
#Purpose : K8sMaster_install_script
#Author : Prabhu Raja Singh.D

############################################################################################

#Install require docker rpm packages

echo -e "\\n\\nInstalling Docker and Required Libraries."
sh ./scripts/docker.sh >/dev/null 2>&1

echo -e "\\n\\nDocker IP updating and starting Docker service."
sh ./scripts/kubeip.sh

echo -e "\\n\\nLoading K8s Master Docker images."
sh ./scripts/dockerloadimg_master.sh >/dev/null 2>&1

echo -e "\\n\\nInstalling K8s Master."
sh ./scripts/k8smaster_install.sh >/dev/null 2>&1

echo -e "\\n\\nConfiguring K8s Master."
sh ./scripts/k8smaster_config.sh

echo -e "\\n\\nConfiguring K8s Ingress."
sh ./scripts/k8smaster_ingress.sh >/dev/null 2>&1

sed -n -e '/kubeadm join/,$p' ./logs/k8smaster_config.log|head -n2 > k8snodeconfig.txt

echo -e "\\n\\nBringing up Docker Registry."
sh ./scripts/docker_reg.sh >/dev/null 2>&1
