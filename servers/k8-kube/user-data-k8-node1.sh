#!/bin/bash
##############################################################################################
## worker node  
##############################################################################################
sudo apt update -y 
sudo apt install nginx -y 
sudo echo "worker node1 installed" >> /var/www/html/index.html
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo apt install docker.io -y

sudo systemctl enable --now docker # enable and start in single command.

# Adding GPG keys.
curl -fsSL "https://packages.cloud.google.com/apt/doc/apt-key.gpg" | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/kubernetes-archive-keyring.gpg

# Add the repository to the sourcelist.
echo 'deb https://packages.cloud.google.com/apt kubernetes-xenial main' | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt update -y
sudo apt install kubeadm=1.20.0-00 kubectl=1.20.0-00 kubelet=1.20.0-00 -y


# Extra commands to run other than master node 
sudo kubeadm reset pre-flight checks
# now paste the join command you got from the master node and append --v=5 at the end
# kubeadm join 172.31.12.222:6443 --token xvb3w5.zcgb4p3fl5lbubtx     --discovery-token-ca-cert-hash sha256:3e07c28beb66fe9a4916aea164de62636bfd064772687cb99d3a3ca6eea6515b --v=5