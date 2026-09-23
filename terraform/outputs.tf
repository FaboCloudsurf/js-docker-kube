output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.cluster_name.name

}

output "cluster_endpoint" {
  description = "EKS cluster API endpoint"
  value       = aws_eks_cluster.cluster_name.endpoint

}