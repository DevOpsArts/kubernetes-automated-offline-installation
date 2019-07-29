#!/bin/bash
#!/bin/sh

#Version :1.0
#Purpose : K8sMaster_install_script
#Author : Prabhu Raja Singh.D

############################################################################################
rm -rf ./logs/dockerservice.log

exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>./logs/dockerservice.log 2>&1


echo -e "Updating K8sMaster IP to Docker registry"

cp -r scripts/files/daemon.json /etc/docker

systemctl enable docker

systemctl start docker

echo -e "\\n\\nDocker Packages installed and Docker Service is running"
