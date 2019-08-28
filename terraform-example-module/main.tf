# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

module "depnet" {
  source = "./module/depnet"
}

#Create key-pair
resource "aws_key_pair" "deployer" {
  key_name   = "id_rsa"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCnMTA4fOI4yzLmsm7v7uBS24n8VKTymEecqIR+jYCQpGR73rnIE5QDCFKrCygHKbswfA5NwdHYfGoWyVk8kQcnprU1R7gmVTWQya1XXO4K8B3jD3Vr8yVGJ3WHtrYRGl8vS+RCy0beuFRYn1OQTNssrK0dFLEmct8GtJt895XJQrkTihYXJwPmRUCSr/9vV4YEa2oqZWTBTn/8wDFo0hr4e2Mbtb2hA2X06qV6eStfTw7pYUHoO0US0mogukL5DaaeO5MAk+HA+Z1qhOr50KECDD31weKgKzLj2NMBY/m+PCk7CGWPRS+xnDjx46L66jj3A6ChzjG+rA8QxkJmHjaf prakash@prakash-Veriton-M200-H310"
}

# Create an EC2 instance
resource "aws_instance" "example" {
  # AMI ID for Amazon Linux AMI 2016.03.0 (HVM)
  ami           = "ami-009110a2bf8d7dd0a"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.deployer.key_name}"
  
  subnet_id     = "${module.depnet.sn_id}"
  vpc_security_group_ids = ["${module.depnet.sg_id}"]
  associate_public_ip_address = true/**/
  
  tags {
    Name = "test-ec2"
  }
  #security_groups = ["${aws_security_group.allow_ssh.name}"]
  /*security_groups = [
        "${var.aws_security_group[0]}",
        "${var.aws_security_group[1]}"
  ]
  */
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