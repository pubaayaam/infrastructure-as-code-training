# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

#Create security group with ssh access on port 22
#Create key-pair
#seperate out in different module
#include module in this file

# Create an EC2 instance
resource "aws_instance" "example" {
  # AMI ID for Amazon Linux AMI 2016.03.0 (HVM)
  ami           = "ami-009110a2bf8d7dd0a"
  instance_type = "t2.micro"
  key_name      = "MyKeyPair"
  security_groups = [
        "${var.aws_security_group[0]}",
        "${var.aws_security_group[1]}"
  ]
  #security_groups = [
  #      "ec2sshaccess",
  #      "default"
  #]
  tags {
    Name = "example"
  }
}