data "aws_ami" "amzami" {
  most_recent = true
  owners = [ "amazon", "self" ]
  
    filter {
        name = "root-device-type"
        values = [ "ebs" ]
    }

    filter {
        name = "virtualization-type"
        values = [ "hvm" ]
    }

    filter {
        name = "architecture"
        values = [ "x86_64" ]
    }
}

data "aws_eks_cluster" "myapp-cluster" {
  name = module.eks.cluster_name
}

data "aws_eks_cluster_auth" "myapp-cluster" {
  name = module.eks.cluster_name
}