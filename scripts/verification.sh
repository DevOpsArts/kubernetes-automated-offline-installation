#!/bin/bash
#!/bin/sh

#Version :1.0
#Purpose : K8sMaster_install_script
#Author : Prabhu Raja Singh.D

############################################################################################

#Install require docker rpm packages

cp -r k8snodeconfig.txt ./README


echo -e "\\n\\nBelow the status of K8s Nodes:\\n\\n"

kubectl get nodes

echo -e "\\n\\nBelow the status of K8s pods:\\n\\n"

kubectl get pods -n kube-system

echo -e "\\n\\nBelow the status of all namespaces services:\\n\\n"
kubectl get svc --all-namespaces

kubectl get all --all-namespaces > ./logs/kubectlstatus.log

