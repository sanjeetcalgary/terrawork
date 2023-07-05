
output "vpc_id" {
    value = aws_vpc.nginx_vpc.id
}

output "child_module_attr" {
  value = module.my-subnet.IGW
}

output "child_module_attr1" {
  value = module.my-instance.ec2-publicIP
}


