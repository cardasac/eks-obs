terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.58.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.13.1"
    }
  }

  required_version = ">= 1.9.0"
}