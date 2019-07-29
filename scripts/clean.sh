#!/bin/bash
#!/bin/sh

#Version :1.0
#Purpose : Kubernetes_install_script
#Date: 09/04/2019
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
>./logs/dockerload_k8smaster.log
>./logs/dockerload_k8snode.log
>./logs/dockerload_nhimages.log
>./logs/dockerinstall.log
>./logs/k8s_presetup.log
>./logs/dockerservice.log
>./scripts/files/memcount.txt
>./scripts/files/cpu.txt

>./logs/devopsart_deploy.log
>./logs/k8smaster_install_svc.log
>./logs/k8smaster_config.log
>./logs/k8smaster_ingress.log
>./logs/docker_registry.log
>./logs/internetstatus.txt
>./logs/k8snodesetup.log
>./logs/kubectlstatus.log
############################################################################################

