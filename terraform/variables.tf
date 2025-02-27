variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "my-app-cluster"
}

variable "node_groups" {
  type = map(object({
    name       = string,
    subnets = list(string)
  }))
  default = {
    private_nodegroup = {
      name = "private_ng"
      subnets = ["subnet-0b3a4080f26c73bd8", "subnet-076aa7cf177805888"]
    },
    public_nodegroup = {
      name = "public_ng"
      subnets = ["subnet-e60320da", "subnet-59e4e13c"]
    }
  }
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = "vpc-387c9241"
}

variable "public_subnet_ids" {
  description = "List of public subnets"
  type        = list(string)
  default     = ["subnet-e60320da", "subnet-59e4e13c"]
}

variable "private_subnet_ids" {
  description = "List of private subnets"
  type        = list(string)
  default     = ["subnet-0b3a4080f26c73bd8", "subnet-076aa7cf177805888"]
}

variable "node_iam_role" {
  description = "nodes IAM role"
  type        = string
  default     = "arn:aws:iam::615343348758:role/bdi-eks-cluster"
}
