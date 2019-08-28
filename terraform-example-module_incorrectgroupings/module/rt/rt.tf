
module "vpc" {
  source = "../vpc"
}

# Create the Route Table
resource "aws_route_table" "My_VPC_route_table" {
    vpc_id = "${module.vpc.vpc_id}"
tags {
        Name = "My VPC Route Table"
    }
} # end resource
