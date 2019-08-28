# Create the Internet Access
resource "aws_route" "My_VPC_internet_access" {
  route_table_id         = "${module.rt.rt_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${module.ig.ig_id}"
} # end resource
