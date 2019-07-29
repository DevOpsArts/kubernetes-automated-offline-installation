#!/bin/bash
#!/bin/sh

#Version :1.0
#Purpose : K8sMaster_install_script
#Author : Prabhu Raja Singh.D

############################################################################################

rm -rf ./logs/dockerload_k8snode.log

exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>./logs/dockerload_k8snode.log 2>&1


echo "Step 1:Loading K8s node Docker Images "

cd ./app/k8simages/ && docker load -i k8snode_img.tar
