terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.regions[0]

}
resource "random_id" "rand_id" {
  byte_length = 8
}

resource "aws_s3_bucket" "mybucket" {
  bucket = "my-unique-bucket-name-955"
}

resource "aws_s3_bucket_object" "myobject" {
  bucket = aws_s3_bucket.mybucket.id
  key    = "myfile.txt"
  source = "myfile.txt"
}

output "random_id" {
  value = random_id.rand_id.b64_url
}
  