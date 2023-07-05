resource "aws_security_group" "nginx-ssh-sg" {
  description = "security group to allow ssh on port-80"
  vpc_id = var.vpc_id
  ingress {
    from_port = var.ssh_port
    to_port = var.ssh_port
    protocol = "tcp"
    cidr_blocks = ["${var.own_ip}/32"]
  }

   ingress {
    from_port = var.nginx_port
    to_port = var.nginx_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    prefix_list_ids = []
  }
  tags = {
    "Name" : "nginx-ssh-sg"
  }
}

resource "aws_key_pair" "ec2-ssh-keypair" {
  key_name = "app-key"
  # this can be found in ~/.ssh/id_XXXXXX.pub
  public_key = file(var.keylocation)

}

resource "aws_instance" "myapp-server" {
  ami = data.aws_ami.amzami.id
  instance_type = var.instance_type
  availability_zone = var.aws_availzone
  key_name = aws_key_pair.ec2-ssh-keypair.key_name
  subnet_id = var.subnet_id
  vpc_security_group_ids = [aws_security_group.nginx-ssh-sg.id]
  associate_public_ip_address = true
  user_data = <<EOF
                #!/bin/bash
                sudo yum update -y
                sudo yum install docker -y 
                sudo systemctl start docker
                sudo usermod -aG docker ec2-user
                docker run -p 8080:80 nginx
            EOF
  tags = {
    "Name" : "App-Server"
  }
  depends_on = [ aws_key_pair.ec2-ssh-keypair ]
}

