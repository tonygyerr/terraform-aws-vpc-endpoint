provider "aws" {
  # version = "~> 2.0"
  region  = "us-east-1"
  profile = var.profile
}

terraform {
  backend "s3" {
  }
}
