terraform {
  backend "s3" {
    bucket = "alviralex-terraform"
    key    = "eks-obs/helm/terraform.tfstate"
    region = "eu-west-1"

    dynamodb_table = "base-terraform"
    encrypt        = true
  }
}
