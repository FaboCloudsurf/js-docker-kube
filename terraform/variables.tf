variable "region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "flask_cluster_name"
}

variable "node_group_name" {
  default = "flask_node_group"
}

variable "eks_node_role" {
  default = "flask_node_role"
}

variable "cluster_role" {
 default = "flask_cluster_role"
}



variable "node_instance_type" {
  default = "t3.medium"
}

variable "desired_capacity" {
  default = 2
}

variable "min_capacity" {
  default = 1
}

variable "max_capacity" {
  default = 3
}

variable "cluster_version" {
    default = "1.32"
}

