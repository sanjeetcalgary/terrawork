output "subnet-module" {
  value = aws_subnet.nginx_subnet
}

output "IGW" {
  value = aws_internet_gateway.nginx_igw.id
}

output "route-table" {
  value = aws_route_table.nginx_rtable.id
}