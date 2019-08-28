
module "sn" {
  source = "../sn"
  
}

module "rt" {
  source = "../rt"
  
}

# Associate the Route Table with the Subnet
resource "aws_route_table_association" "My_VPC_association" {
    subnet_id      = "${module.sn.sn_id}"
    route_table_id = "${module.rt.rt_id}"
} # end resource
