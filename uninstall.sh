#!/bin/bash
#!/bin/sh

#Version :1.0
#Purpose : Kubernetes_install_script
#Date: 09/04/2019
#Author : Prabhu Raja Singh.D
###################################################################
printf '%120s\n' | tr ' ' =
echo -e "\\nKubernetes Cluster uninstallation setup!!!\\n"

echo -e "\\n\\nAre you sure to remove Kubernetes applications from this server? (y/n)."

read continue

if [ "$continue" = "y" ] ; then

echo -e "\\n\\nRemoving Kubernetes and related libraries from this server\\n\\n"

sleep 2s

kubeadm reset -f >/dev/null 2>&1

service kubelet stop >/dev/null 2>&1
service docker stop >/dev/null 2>&1
yum remove httpd kubeadm kubelet kubectl docker -y >/dev/null 2>&1

rm -rf ~/.kube
yum autoremove -y >/dev/null 2>&1
rm -rf /etc/kubernetes/
rm -rf /opt/cni/
rm -rf /var/lib/kubelet/
rm -rf /var/log/pods/
rm -rf /usr/libexec/kubernetes
rm -rf /etc/systemd/system/kubelet.service.d
rm -rf /etc/systemd/system/multi-user.target.wants/kubelet.service
rm -rf /etc/docker/
rm -rf /var/lib/docker
rm -rf /var/lib/dockershim/
rm -rf /var/lib/cni/
rm -rf /etc/cni/
rm -rf /var/lib/etcd/


echo -e "\\n\\nThank you, Kuberntes and related libraries are removed from this server.!!!"
printf '%120s\n' | tr ' ' =
else

echo -e "\\n\\nThank you, Kuberntes and related libraries are not removed from this server.!!!"
printf '%120s\n' | tr ' ' =
fi
