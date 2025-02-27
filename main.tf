module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.33.1"
  cluster_name    = var.cluster_name
  cluster_version = "1.31"
  subnet_ids      = concat(var.public_subnet_ids, var.private_subnet_ids)
  vpc_id          = var.vpc_id
  enable_irsa     = true
}

resource "aws_eks_node_group" "ng" {
  cluster_name    = var.cluster_name
  node_role_arn   = var.node_iam_role
  for_each        = var.node_groups
  node_group_name = each.value["name"]
  subnet_ids      = each.value["subnets"]
  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }
}