resource "aws_subnet" "nginx_subnet" {
  vpc_id = var.vpc_id
  availability_zone = var.aws_availzone
  cidr_block = var.subnet_cidr
  tags = {
    "Name" : "nginx-vpc-subnet"
  }
}

resource "aws_internet_gateway" "nginx_igw" {
  vpc_id = var.vpc_id
  tags = {
    "Name" : "nginx-igw"
  }
}

resource "aws_route_table" "nginx_rtable" {
  vpc_id = var.vpc_id
  depends_on = [ aws_internet_gateway.nginx_igw]
  tags = {
    "Name" : "nginx-route-table"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.nginx_igw.id
  }
}

resource "aws_route_table_association" "nginx_associate_subnet" {
  subnet_id = aws_subnet.nginx_subnet.id
  route_table_id = aws_route_table.nginx_rtable.id
}