module "eks-vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = "eks-vpc"
  cidr = var.vpc_cidr_block
  azs = var.eks_azs
  private_subnets = var.private_subnets
  public_subnets = var.public_subnets
  enable_nat_gateway = var.nat_gw
  single_nat_gateway = var.single_gw
  enable_dns_hostnames = var.dns_host

  tags = {
    "kubernetes.io/cluster/myapp-eks-cluster" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/myapp-eks-cluster" = "shared"
    "kubernetes.io/role/elb" = 1
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/myapp-eks-cluster" = "shared"
    "kubernetes.io/role/internal-elb" = 1
  }


}