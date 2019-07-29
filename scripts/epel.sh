#!/bin/bash
#!/bin/sh

#Version :1.0
#Purpose : K8sMaster_install_script
#Author : Prabhu Raja Singh.D

############################################################################################

#Install require docker rpm packages

echo -e "Step 1:Installing Docker and required libraries\\n\\n"

cd ./app/lib/epel && rpm -ivh epel-release-7-11.noarch.rpm >/dev/null 2>&1

