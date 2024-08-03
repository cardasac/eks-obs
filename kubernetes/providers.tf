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

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.cluster.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
    token                  = data.aws_eks_cluster_auth.cluster.token
  }
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}

data "aws_eks_cluster" "cluster" {
  name = "eks-obs-cluster"
}

data "aws_eks_cluster_auth" "cluster" {
  name = "eks-obs-cluster"
}