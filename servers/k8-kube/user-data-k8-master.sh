#!/bin/bash
##############################################################################################
## master node 
##############################################################################################

sudo apt update -y 
sudo apt install nginx -y 
sudo echo "master node installed" >> /var/www/html/index.html
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo apt install docker.io -y

sudo systemctl enable --now docker # enable and start in single command.

# Adding GPG keys.
curl -fsSL "https://packages.cloud.google.com/apt/doc/apt-key.gpg" | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/kubernetes-archive-keyring.gpg

# Add the repository to the sourcelist.
echo 'deb https://packages.cloud.google.com/apt kubernetes-xenial main' | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt update -y
sudo apt install kubeadm=1.20.0-00 kubectl=1.20.0-00 kubelet=1.20.0-00 -y

# execute this only in master node 
#sudo kubeadm init
kubeadm init --ignore-preflight-errors=NumCPU


# if you are a root user
export KUBECONFIG=/etc/kubernetes/admin.conf
# if non  root user
mkdir -p /root/.kube
sudo cp -i /etc/kubernetes/admin.conf /root/.kube/config
sudo chown $(id -u):$(id -g) /root/.kube/config
#mkdir -p $HOME/.kube
#sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
#sudo chown $(id -u):$(id -g) $HOME/.kube/config


kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml


## sudo kubeadm token create --print-join-command  >> /home/ubuntu/token8.sh
# this command create an out of token need to save that token, to execute to slave node to join the master node 
# Paste the join command you got from the master node and append --v=5 at the end.







