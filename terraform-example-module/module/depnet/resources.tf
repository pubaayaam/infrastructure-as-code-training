
# Declare the data source for availability zone
data "aws_availability_zones" "available" {
  state = "available"
}

#- module.vpc
#create vpc
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  
  tags {
    Name = "test-vpc"
  }
}

#- module.ig.vpc
# Create the Internet Gateway
resource "aws_internet_gateway" "My_VPC_GW" {
  vpc_id = "${aws_vpc.main.id}"
tags {
        Name = "My VPC Internet Gateway"
    }
} # end resource

#- module.rt.vpc
#- module.rtasso.rt
#- module.rtasso.rt.vpc
# Create the Route Table
resource "aws_route_table" "My_VPC_route_table" {
    vpc_id = "${aws_vpc.main.id}"
tags {
        Name = "My VPC Route Table"
    }
} # end resource

#- module.sn.vpc
#- module.rtasso.sn.vpc
#create subnet
resource "aws_subnet" "main" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.0.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[1]}" # 0,1 and 2
  #availability_zone = "${module.az.az_name}" # 0,1 and 2

  tags = {
    Name = "test-subnet"
  }
}

#- module.rtasso.sn
# Associate the Route Table with the Subnet
resource "aws_route_table_association" "My_VPC_association" {
    subnet_id      = "${aws_subnet.main.id}"
    route_table_id = "${aws_route_table.My_VPC_route_table.id}"
} # end resource


# Create the Internet Access
resource "aws_route" "My_VPC_internet_access" {
  route_table_id         = "${aws_route_table.My_VPC_route_table.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.My_VPC_GW.id}"
} # end resource

#- module.sg.vpc
#Create security group with ssh access on port 22
resource "aws_security_group" "allow_ssh" {
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
}