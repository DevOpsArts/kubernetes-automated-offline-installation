Note : Use this script where internet is not available.

Requirements:

OS : Centos/RHEL- 7.4,7.5
Total servers : 3 (Kubernetes Master 1, Kubernetes node -2)
Resources : 2Core,4GB RAM,25GB HDD each server

Deployments:

1.Kubernetes
2.Kubernetes Nginx Ingress
3.Docker
4.Docker registry

Scripts:

1.setup.sh - will do the presetup for k8s server deployment
2.install.sh - will install the required packages and configure it
4.verify.sh - will show the status of K8s pods and services.
5.Uninstall.sh:  uninstall.sh will remove all the K8s applications from the server.

README directory : It has all the successful execution data to compare with your installation.(Basically for reference)

Logs :  All installtions log will be logged for each and every process during the installation.
------------------------------------------------------------------------------------------------
Installation:

Master server :

1.Run setup.sh then reboot the server
2.Run install.sh to do the installation.

Node Servers :

1.Run setup.sh then reboot the server
2.Run install.sh to do the installation.

--------------------------------------------------------------------------------------------------
Testing an APP,

1.Upload your image to local docker registry.
2.Create pod and svc for the app (examples pods,svc files are in config directory).
3.Run the app in kubernetes.
