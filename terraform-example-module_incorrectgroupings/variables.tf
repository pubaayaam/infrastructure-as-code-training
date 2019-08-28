variable "environment" {
  type        = "string"
  description = "Environment in which to deploy application"
  default     = "aws"
}

variable "another_variable" {
  default = "tg4solutions"
}

variable "aws_vpc" {
  default = "default"
}


variable "aws_security_group" {
  default = ["default", "ec2sshaccess"]
}