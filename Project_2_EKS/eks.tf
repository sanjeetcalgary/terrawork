module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.3"
  cluster_name    = "myapp-eks-cluster"
  cluster_version = "1.21"
  subnet_ids = module.eks-vpc.private_subnets
  vpc_id = module.eks-vpc.vpc_id
  tags = {
    "environment" = "testing"
    "application" = "myapp"
  }
  self_managed_node_groups = {
    one = {
      name = "worker-group-1"
      max_size     = 3
      desired_size = 2
      instance_type     = "t2.small"
    }
    two = {
      name = "worker-group-2"
      max_size     = 3
      desired_size = 2
      instance_type     = "t2.medium"
    }
  }

}