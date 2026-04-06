module "networking" {
  source = "./modules/networking"

  vpc_cidr = "172.16.0.0/16"

  public_subnet_cidrs  = ["172.16.4.0/24", "172.16.8.0/24"]
  private_subnet_cidrs = ["172.16.2.0/24", "172.16.6.0/24"]

  availability_zones = ["us-east-2b", "us-east-2c"]
}

module "eks" {
  source = "./modules/eks"

  cluster_name       = var.cluster_name
  cluster_version    = var.cluster_version
  vpc_id             = module.networking.vpc_id
  private_subnet_ids = module.networking.private_subnet_ids

  node_group_name = var.node_group_name
  instance_types  = var.instance_types
  desired_size    = var.desired_size
  min_size        = var.min_size
  max_size        = var.max_size
}

