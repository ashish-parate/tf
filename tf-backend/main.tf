terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "my-unique-bucket-45f8aa0f5136a438"
    key    = "backends.tfstate"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "myserver" {
  ami           = "ami-08e3b3155fc937a94"
  instance_type = "t3.micro"

  tags = {
    Name = "ExampleInstance"
  }
}