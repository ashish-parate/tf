terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = ap-south-1
}

resource "aws_instance" "myserver" {
  ami           = "ami-01a00762f46d584a1"
  instance_type = var.instance_type
}

  root_block_device {
    delete_on_termination = var.root_block_device.delete_on_termination
    volume_size = var.root_block_device.volume_size
    volume_type = var.root_block_device.volume_type
  }

    tags = merge(var.additional_tags, {
    Name = "ExampleInstance"})