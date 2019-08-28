#output "az_name" {
#  value = "data.aws_availability_zones.available.names[1]"
#}

output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "ig_id" {
  value = "${aws_internet_gateway.My_VPC_GW.id}"
}

output "rt_id" {
  value = "${aws_route_table.My_VPC_route_table.id}"
}

output "sn_id" {
  value = "${aws_subnet.main.id}"
}

output "sg_id" {
  value = "${aws_security_group.allow_ssh.id}"
}