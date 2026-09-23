resource "aws_eks_access_entry" "flask_admin" {
  cluster_name      = aws_eks_cluster.cluster_name.name
  principal_arn     = "arn:aws:iam::730335577638:user/Iamadmin-cloudsurf"
  #kubernetes_groups = ["group-1", "group-2"]
  #type              = "STANDARD"
}

resource "aws_eks_access_policy_association" "flask_admin" {
  cluster_name  = aws_eks_cluster.cluster_name.name
  policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn     = "arn:aws:iam::730335577638:user/Iamadmin-cloudsurf"

  access_scope {
    type       = "cluster"
    #namespaces = ["example-namespace"]
  }
}