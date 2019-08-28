# Create an EC2 instance
resource "aws_instance" "example" {
  # AMI ID for Amazon Linux AMI 2016.03.0 (HVM)
  ami           = "ami-009110a2bf8d7dd0a"
  instance_type = "t2.micro"
  key_name      = "${module.kp.kp_name}"
  
  subnet_id     = "${module.sn.sn_id}"
  vpc_security_group_ids = ["${module.sg.sg_id}"]
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