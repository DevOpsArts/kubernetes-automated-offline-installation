#!/bin/bash
#!/bin/sh

#Version :1.0
#Purpose : K8sMaster_install_script
#Author : Prabhu Raja Singh.D

############################################################################################

rm -rf ./logs/k8smaster_ingress.log

exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>./logs/k8smaster_ingress.log 2>&1

echo "Step 1:Installing Kubernetes Nginx Ingress"

kubectl apply -f ./app/ingress/mandatory.yaml
kubectl apply -f ./app/ingress/service-nodeport.yaml
