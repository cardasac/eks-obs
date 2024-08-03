variable "region" {
  type        = string
  description = "The AWS region to create resources in"
  default     = "eu-west-1"
}

variable "workspace_iam_roles" {
  type = map(string)
  default = {
    production = "arn:aws:iam::058264337640:role/Terraform"
  }
}

variable "environment" {
    type = string
}