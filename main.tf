terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0a59fb4395466ed05"
  instance_type = "t3.micro"

  tags = {
    Name = "ExampleInstance"
  }
}