#!/bin/bash
#!/bin/sh

#Version :1.0
#Purpose : K8sMaster_install_script
#Author : Prabhu Raja Singh.D

############################################################################################


echo -e "\\n\\nThis script will show the status of all kubernetes Pods,services."

sleep 2s

echo -e "\\n\\nBelow the status of K8s Nodes:\\n\\n"

kubectl get nodes

sleep 2s

echo -e "\\n\\nBelow the status of K8s pods:\\n\\n"

kubectl get pods -n kube-system

sleep 2s

echo -e "\\n\\nBelow the status of all namespaces services:\\n\\n"
kubectl get svc --all-namespaces
