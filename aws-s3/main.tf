terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.regions[0]
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "my-unique-bucket-name-955"
}

  