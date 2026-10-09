terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
}

provider "aws" {
    region = "ap-south-1"
    }

data "aws_ami" "name" {
    most_recent = true
    owners      = ["amazon"]


  
}

output "ami_id" {
  value = data.aws_ami.name.id
} 

resource "aws_instance" "myserver" {
  ami           = "ami-08e3b3155fc937a94" # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t3.micro"

  tags = {
    Name = "sampleserver"
  }
}