#!/bin/bash
#!/bin/sh

#Version :1.0
#Purpose : K8sMaster_install_script
#Author : Prabhu Raja Singh.D

############################################################################################

rm -rf ./logs/dockerload_k8smaster.log

exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>./logs/dockerload_k8smaster.log 2>&1


echo "Step 1:Loading Docker Images to Docker"

cd ./app/k8simages/ && docker load -i k8smaster_img.tar
