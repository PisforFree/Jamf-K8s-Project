module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnet_ids

  enable_irsa = true

  cluster_endpoint_public_access = true

  eks_managed_node_groups = {
    default = {
      name           = var.node_group_name
      instance_types = var.instance_types

      desired_size = var.desired_size
      min_size     = var.min_size
      max_size     = var.max_size

      subnet_ids = var.private_subnet_ids
    }
  }

  access_entries = {
    test_user = {
      principal_arn = "arn:aws:iam::803767876973:user/Test_user"

      policy_associations = {
        admin = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }
}