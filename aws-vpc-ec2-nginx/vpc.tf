# create vpc and subnets
resource "aws_vpc" "my_vpc" {  
  cidr_block = "10.0.0.0/16"
    tags = {
        Name = "my_vpc"
    }
}

#private subnet in the VPC
resource "aws_subnet" "private_subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.my_vpc.id
    tags = {
        Name = "private_subnet"
    }
}

#public subnet in the VPC
resource "aws_subnet" "public_subnet" {
  cidr_block = "10.0.2.0/24"
  vpc_id     = aws_vpc.my_vpc.id
  map_public_ip_on_launch = true
    tags = {
        Name = "public_subnet"
    }
}

#igw
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
    tags = {
        Name = "my_igw"
    }
}

#route table
resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}

#route table association
resource "aws_route_table_association" "public_subnet_association" {
    subnet_id      = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.my_rt.id
}