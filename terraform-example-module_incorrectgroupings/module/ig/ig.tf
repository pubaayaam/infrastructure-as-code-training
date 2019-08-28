
module "vpc" {
  source = "../vpc"
}


# Create the Internet Gateway
resource "aws_internet_gateway" "My_VPC_GW" {
  vpc_id = "${module.vpc.vpc_id}"
tags {
        Name = "My VPC Internet Gateway"
    }
} # end resource