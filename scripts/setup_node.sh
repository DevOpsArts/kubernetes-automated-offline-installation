#!/bin/bash
#!/bin/sh

#Version :1.0
#Purpose : K8sMaster_install_script
#Author : Prabhu Raja Singh.D

############################################################################################
rm -rf ./logs/k8snodesetup.log

exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>./logs/k8snodesetup.log 2>&1

blink='\033[0;5m'
normal=$(tput sgr0)
black='\033[0;30m'
GREEN='\033[0;32m'
RED='\033[0;31m'
yellow='\033[0;33m'
NC='\033[0m' # No Color
############################################################################################
echo -e "\\n\\nInstalling Docker"
sh ./scripts/docker.sh

echo -e "\\n\\nUpdating Docker IP and Starting Docker."
sh ./scripts/kubeip.sh

echo -e "\\n\\nLoading K8s Node Docker Images."
sh ./scripts/dockerloadimg_node.sh

echo -e "\\n\\nInstalling K8s node"
sh ./scripts/k8smaster_install.sh

echo -e "\\n\\nK8s Node server setup is completed.!!!"
