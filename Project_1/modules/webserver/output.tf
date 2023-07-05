
output "SG" {
  value = aws_security_group.nginx-ssh-sg.id
}

output "ec2-publicIP" {
  value = aws_instance.myapp-server.public_ip
}

output "ec2-url" {
  value = aws_instance.myapp-server.public_dns
}

output "AWS-AMI" {
  value = data.aws_ami.amzami.id
}
