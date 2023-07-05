variable "vpc_id" {
  type = string
  description = "VPC ID"
}


variable "nginx_port" {
  type = number
}

variable "ssh_port" {
  type = number
}


variable "own_ip" {
  type = string
  description = "Own IPv4"
}

variable "instance_type" {
  type = string
  description = "Own IPv4"
  default = "t2.micro"
}

variable "keylocation" {
  type = string
  description = "login key"
  
}

variable "subnet_id" {
  type = string
}

variable "aws_availzone" {
  
}