# terraform {
# backend "s3" {
#     bucket  = "my-app-tf-states"
#     key     = "terraform/state/eks-cluster.tfstate"
#     region  = var.region
#     encrypt = true
# }
# }