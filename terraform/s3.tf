

terraform {
  backend "s3" {
    bucket = "mentis-backend-bucket"
    key    = "kube_deploy_project/terraform/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
  }
}