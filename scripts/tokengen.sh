#!/bin/bash
#!/bin/sh

#Version :1.0
#Purpose : K8sMaster_install_script
#Author : Prabhu Raja Singh.D

############################################################################################

rm -rf ./logs/token.log

exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>./logs/token.log 2>&1


echo -e "\\n\\nGenerating token for kubeapps.\\n\\n"

kubectl create -n default serviceaccount kubeappsadmin

kubectl create clusterrolebinding kubeappsadmin --clusterrole=cluster-admin --serviceaccount=default:kubeappsadmin

echo -e "\\n\\nCopy the below token and save it some place, We will use it to login kubeapps dashboard\\n\\n"

kubectl get secret $(kubectl get serviceaccount kubeappsadmin -o jsonpath='{.secrets[].name}') -o jsonpath='{.data.token}' | base64 --decode

kubectl get secret $(kubectl get serviceaccount kubeappsadmin -o jsonpath='{.secrets[].name}') -o jsonpath='{.data.token}' | base64 --decode > kubeapps-token.txt

echo -e "\\n\\n"

#kubectl patch svc kubeapps -n kubeapps --type='json' -p '[{op:replace,path:/spec/type,value:NodePort}]'

echo -e "\\n\\nPlease check Kubeapps status before access in browser, command to check, kubectl get pods -n kubeapps"

