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

#vpc id
data "aws_vpc" "name" {
    tags = {
        Environment = "Production"
        name = "my_vpc"
    }
}
output "vpc_id" {
  value = data.aws_vpc.name.id
}


# avablility zone
data "aws_availability_zones" "name" {
    state = "available"
}   

output "availability_zones" {
  value = data.aws_availability_zones.name.names
}


#account details
data "aws_caller_identity" "current" {}

output "caller_info" {
  value = data.aws_caller_identity.current
}

#region
data "aws_region" "current" {}

output "region" {
  value = data.aws_region.current.name
}

#security group
data "aws_security_group" "name" {
    tags = {
        mywebserver = "http"
    }
}
  


resource "aws_instance" "myserver" {
  ami           = data.aws_ami.name.id # Amazon Linux 2 AMI (HVM), SSD Volume Type
  instance_type = "t3.micro"

  tags = {
    Name = "sampleserver"
  }
}