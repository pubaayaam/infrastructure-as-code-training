# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

#vpc module
#https://github.com/terraform-aws-modules/terraform-aws-vpc
/*module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}*/

#create vpc
/*resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  
  tags {
    Name = "test-vpc"
  }
}*/

#create network access control list
/*resource "aws_network_acl" "main" {
  vpc_id = "${aws_vpc.main.id}"
  subnet_ids = ["${aws_subnet.main.id}"]

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "test-acl"
  }
}*/

# Declare the data source
data "aws_availability_zones" "available" {
  state = "available"
}


#create subnet
/*resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.0.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"

  tags = {
    Name = "test-subnet"
  }
}*/

#Create security group with ssh access on port 22
/*resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["103.81.78.15/32"] # add a CIDR block here
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    #prefix_list_ids = ["pl-12c4e678"]
  }

  tags = {
    Name = "test-sg"
  }
}*/

#Create key-pair
resource "aws_key_pair" "deployer" {
  key_name   = "id_rsa"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCnMTA4fOI4yzLmsm7v7uBS24n8VKTymEecqIR+jYCQpGR73rnIE5QDCFKrCygHKbswfA5NwdHYfGoWyVk8kQcnprU1R7gmVTWQya1XXO4K8B3jD3Vr8yVGJ3WHtrYRGl8vS+RCy0beuFRYn1OQTNssrK0dFLEmct8GtJt895XJQrkTihYXJwPmRUCSr/9vV4YEa2oqZWTBTn/8wDFo0hr4e2Mbtb2hA2X06qV6eStfTw7pYUHoO0US0mogukL5DaaeO5MAk+HA+Z1qhOr50KECDD31weKgKzLj2NMBY/m+PCk7CGWPRS+xnDjx46L66jj3A6ChzjG+rA8QxkJmHjaf prakash@prakash-Veriton-M200-H310"
}
#seperate out in different module
#include module in this file

# Create an EC2 instance
resource "aws_instance" "example" {
  # AMI ID for Amazon Linux AMI 2016.03.0 (HVM)
  ami           = "ami-009110a2bf8d7dd0a"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.deployer.key_name}"
  
  /*subnet_id     = "${aws_subnet.main.id}"
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  associate_public_ip_address = true*/
  
  #security_groups = ["${aws_security_group.allow_ssh.name}"]
  security_groups = [
        "${var.aws_security_group[0]}",
        "${var.aws_security_group[1]}"
  ]
  tags {
    Name = "test-ec2"
  }
  #key_name      = "MyKeyPair"
  #security_groups = ["${aws_security_group.allow_ssh.name}"]
  #security_groups = [
    #"${var.aws_security_group[0]}",
    #"${aws_security_group.allow_ssh.name}"
  #]
  #security_groups = [
  #      "ec2sshaccess",
  #      "default"
  #]
  
}