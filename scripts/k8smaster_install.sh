#!/bin/bash
#!/bin/sh

#Version :1.0
#Purpose : K8sMaster_install_script
#Author : Prabhu Raja Singh.D

############################################################################################

rm -rf ./logs/k8smaster_install_svc.log

exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>./logs/k8smaster_install_svc.log 2>&1


echo "Step 1:Installing Kubernetes and required libraries"

cd ./app/lib/kubelet && rpm -ivh --replacefiles --replacepkgs *.rpm

sleep 10s

systemctl enable kubelet

systemctl start kubelet

echo -e "\\n\\nKubernetes packages installed and  service is running"
