provider "aws" {
  region = "ap-south-1" # Change this to your desired AWS region
  access_key  = "<test>"
  secret_key  = "<test>"
}

# MASTER NODE SETUP
resource "aws_instance" "master" {
  ami           = "ami-0287a05f0ef0e9d9a" # Replace with your desired AMI ID
  instance_type = "t2.small"   # instance type
  key_name      = "MYAWSKEY"    # key name
  tags = {
    Name = "K8-master"
  }
  user_data = file("./user-data-k8-master.sh")    # user data file 
  vpc_security_group_ids = ["sg-011712e13a3c1877a"]  # vpc security group id
  subnet_id = "subnet-e7a6ffab"       # subnet id
  
}

# WORKER NODE SETUP
resource "aws_instance" "node1" {
  ami           = "ami-0287a05f0ef0e9d9a" # Replace with your desired AMI ID
  instance_type = "t2.micro"   # instance type
  key_name      = "MYAWSKEY"    # key name
  tags = {
    Name = "K8-node1"
  }
  user_data = file("./user-data-k8-node1.sh")    # user data file 
  vpc_security_group_ids = ["sg-011712e13a3c1877a"]  # vpc security group id
  subnet_id = "subnet-e7a6ffab"       # subnet id
  
}

#########################################################################
# MINICUBE SETUP (uncomment to use this setup instead of k8-cluster)
########################################################################

# provider "aws" {
#   region = "ap-south-1" # Change this to your desired AWS region
#   access_key  = "test"
#   secret_key  = "test"
# }
# resource "aws_instance" "minicube" {
#   ami           = "ami-0287a05f0ef0e9d9a" # Replace with your desired AMI ID
#   instance_type = "t2.small"   # instance type
#   key_name      = "MYAWSKEY"    # key name
#   tags = {
#     Name = "K8-tf-minicube"
#   }
#  # user_data = file("./user-data-k8-minicube.sh")    # user data file 
#   vpc_security_group_ids = ["sg-011712e13a3c1877a"]  # vpc security group id
#   subnet_id = "subnet-e7a6ffab"       # subnet id
  
# }




