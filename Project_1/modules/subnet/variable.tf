
variable "subnet_cidr" {
  type = string
  description = "CIDR block for Subnet"
  default = "172.31.1.0/24"
}

variable "aws_availzone" {
  type = string
  description = "Availability Zone"
}

variable "vpc_id" {
  type = string
  description = "VPC ID"
}


