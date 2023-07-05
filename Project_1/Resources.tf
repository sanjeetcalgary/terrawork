resource "aws_vpc" "nginx_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    "Name" : "vpc-qa-project1"
  }
}

module "my-subnet" {
  source = "./modules/subnet"
  subnet_cidr = var.subnet_cidr
  aws_availzone = var.aws_availzone
  vpc_id = aws_vpc.nginx_vpc.id
}

module "my-instance" {
  source = "./modules/webserver"
  vpc_id = aws_vpc.nginx_vpc.id
  own_ip = var.own_ip
  aws_availzone = var.aws_availzone
  nginx_port = var.nginx_port
  ssh_port = var.ssh_port
  instance_type = var.instance_type
  keylocation = var.keylocation
  subnet_id = module.my-subnet.subnet-module.id
  
}