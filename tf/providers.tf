provider "aws" {
  region = "eu-west-1"
  assume_role {
    role_arn = var.workspace_iam_roles[terraform.workspace]
  }

  default_tags {
    tags = {
      Provider    = "terraform"
      Environment = var.environment
    }
  }
}