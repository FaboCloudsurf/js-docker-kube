resource "aws_eks_node_group" "node_group_name" {
  cluster_name    = aws_eks_cluster.cluster_name.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.flask_eks_node_role.arn
  subnet_ids      = [aws_subnet.onepercent_subnet_tf1.id,aws_subnet.onepercent_subnet_tf2.id]

  scaling_config {
    desired_size = var.desired_capacity
    max_size     = var.max_capacity
    min_size     = var.min_capacity
  }

  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.eks_worker_node_policy,
    aws_iam_role_policy_attachment.eks_cni_policy,
    aws_iam_role_policy_attachment.eks_ecr_policy,
  ]
}