#!/bin/bash
#!/bin/sh

#Version :1.0
#Purpose : K8sMaster_install_script
#Author : Prabhu Raja Singh.D

############################################################################################

rm -rf ./logs/docker_registry.log

exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>./logs/docker_registry.log 2>&1

echo "Deploying Docker Registry Container"

docker run -d -p 5000:5000 --restart=always --name registry registry:2

sleep 2s


docker images

