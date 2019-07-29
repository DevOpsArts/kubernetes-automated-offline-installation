#!/bin/bash
#!/bin/sh

#Version :1.0
#Purpose : K8sMaster_install_script
#Author : Prabhu Raja Singh.D

############################################################################################

rm -rf ./logs/dockerinstall.log

exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>./logs/dockerinstall.log 2>&1

#rpm -ivh --replacefiles --replacepkgs ./app/lib/

echo -e "Step 1:Installing Docker and required libraries\\n\\n"

rpm -ivh --replacefiles --replacepkgs ./app/lib/lvm2/*.rpm

rpm -ivh --replacefiles --replacepkgs ./app/lib/docker/*.rpm
