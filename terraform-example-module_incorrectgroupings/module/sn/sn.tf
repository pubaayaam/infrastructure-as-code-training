
module "vpc" {
  source = "../vpc"
}

# Declare the data source for availability zone
data "aws_availability_zones" "available" {
  state = "available"
}
#module "az" {
#  source = "../az"
  
#}

#create subnet
resource "aws_subnet" "main" {
  vpc_id     = "${module.vpc.vpc_id}"
  cidr_block = "10.0.0.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[1]}" # 0,1 and 2
  #availability_zone = "${module.az.az_name}" # 0,1 and 2

  tags = {
    Name = "test-subnet"
  }
}