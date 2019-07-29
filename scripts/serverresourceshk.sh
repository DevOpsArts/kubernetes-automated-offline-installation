#!/bin/bash
#!/bin/sh

#Version :1.0
#Purpose : Kubernetes_install_script
#Date: 09/04/2019
#Author : Prabhu Raja Singh.D
#############################################################################################
setram=6000 #MB
setcpu=2 #Core

>./scripts/files/memcount.txt
>./scripts/files/cpu.txt

free -m|head -n2|tail -n1|awk '{print $2}' > ./scripts/files/memcount.txt
grep -c ^processor /proc/cpuinfo > ./scripts/files/cpu.txt

ram=$(cat ./scripts/files/memcount.txt)
cpu=$(cat ./scripts/files/cpu.txt)

if [ "$ram" -ge "$setram" ] && [ "$cpu" -ge "$setcpu" ] ; then

echo 'This server has enough resources to install k8s'

else

echo "This server is not having enough resources"

fi
