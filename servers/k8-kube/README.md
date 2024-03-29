# Here we are creating a terraform template to create a k8s cluster 
- This is only for testing and learning purposes
## Prerequicites for  creating a k8s cluster with terraform
- Terraform should be installed in the system
- Aws cli installed and configured with proper user credentials which should have access to create instances


# Configuration need to change before executing the script
## terraform file 
- update the AWS Secret key credentials
- update the region of aws 
- update the ami id of that region in which you are 
- update the security group which you ahve created (ALLOW ALL TRAFFIC TO THAT Security Group)
- update subnet id of that region in which you are 
- update instance type (atleast 1 vcpu and 2 gb of ram required)


# Architecture k8s 
## Resources created by terraform 
- 1 master node 
- 1 worker node

## Pre Created Resources
- Security Group 
- AWS key pair
- VPC and Subnet (we are using default vpc and subnet)


## Files in this repository
main.tf - main terraform template file to create a k8s cluster
script.sh -test script (ignore)
user-data-k8-master.sh (user-data to setup master node)
user-data-k8-node1.sh (user-data to setup worker node )
Readme.md - Documentation



# HOW TO USE THIS SETUP:(TERRAFORM)
git clone https://github.com/
cd k8s
### initialise the dir
terraform init
### check formatting of tf file 
terraform fmt  
### validate the configutaion
terraform validate 
### execute the setup 
terraform apply 
### show the resources and configuration
terraform show 
### destroy to delete the infrastructure
terraform destroy


## ######################################################################################
# Minicube-Setup
- minikube status
- minikube stop
- minikube delete


# #####################################################################################
# DASHBOARD DEPLOY

### minikube-dashboard
minikube dashboard --url --port=8081


### Kubernetes-dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
kubectl proxy
kubectl proxy --port=8081 &


### Create a tunnel between local and remote server to access the dashboard of minicube/kubernetes
ssh -i ./PATH/MYAWSKEY -L <mylocalport>:localhost:<dashbaord-port> username@IP
ACCESS URL (localhost)= http://localhost:8081/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy

