# Configure the AWS Provider
module "provider" {
  source = "./module/provider"
}

module "vpc" {
  source = "./module/vpc"
}

module "ig" {
  source = "./module/ig"
}

module "rt" {
  source = "./module/rt"
}

# Declare the data source for availability zone
data "aws_availability_zones" "available" {
  state = "available"
}

#module "az" {
#  source = "./module/az"
  
#}

module "sn" {
  source = "./module/sn"
  
}

module "rtasso" {
  source = "./module/rtasso"
  
}

module "sg" {
  source = "./module/sg"
  
}

module "kp" {
  source = "./module/kp"
  
}