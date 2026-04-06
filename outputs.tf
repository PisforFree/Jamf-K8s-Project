output "cluster_name" {
  description = "EKS Cluster Name"
  value       = var.cluster_name
}

output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_security_group_id" {
  description = "EKS cluster security group ID"
  value       = module.eks.cluster_security_group_id
}

output "eks_node_group_arn" {
  description = "EKS managed node group ARN"
  value       = module.eks.node_group_arn
}

