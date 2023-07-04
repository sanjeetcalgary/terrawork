variable "vpc_cidr" {
  type = string
  description = "CIDR block for VPC"
  default = "172.31.1.0/24"
}

variable "subnet_cidr" {
  type = string
  description = "CIDR block for Subnet"
  default = "172.31.1.0/24"
}

variable "aws_region_qa" {
  type = string
  description = "AWS region"
  default = "us-west-1"
}

variable "aws_availzone" {
  type = string
  description = "Availability Zone"
}

variable "ssh_port" {
  type = number
}

variable "nginx_port" {
  type = number
}

variable "http_port" {
  type = number
}

variable "https_port" {
  type = number
}

variable "own_ip" {
  type = string
  description = "Own IPv4"
}