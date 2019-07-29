#!/bin/bash
#!/bin/sh

#Version :1.0
#Purpose : K8sMaster_install_script
#Author : Prabhu Raja Singh.D

############################################################################################

#Check selinux status

echo -e "Step 1:Checking selinux status and updating\\n\\n"

sudo sed -i 's/enforcing/disabled/g' /etc/selinux/config /etc/selinux/config
#sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux

#Check Firewall status

echo -e "Step 2:Checking firewall status and disabling\\n\\n"

chkconfig firewalld off >/dev/null 2>&1

service firewalld stop >/dev/null 2>&1

#Update system confgiuration

echo -e "Step 3: Updating system configuration\\n\\n"

cp -r scripts/files/k8s.conf /etc/sysctl.d/
cp -r scripts/files/sysctl.conf /etc

sysctl -p >/dev/null 2>&1

#Disable Swap

echo -e "Step 4: Disabling Swap from this server\\n\\n"

swapoff -a 

sed -e '/swap/ s/^#*/#/' -i /etc/fstab

#Restart the server and after restarted run setup.sh

echo -e "Step 5: Firewall,SWAP memory and System configuration is updated\\n\\n"

echo -e "Step 6: Please restart this server now, command: init 6 and then run install.sh"
