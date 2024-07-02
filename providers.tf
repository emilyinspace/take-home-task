# Ref: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
terraform {
  # The version that was used for testing
  required_version = ">= 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

