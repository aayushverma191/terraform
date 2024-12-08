terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.80.0"
    }
  }
}

provider "aws" {
    region = var.region
}

resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "task1"
  }
}
resource "aws_subnet" "pub-subnet1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.pub_sub1
  availability_zone = "us-east-1a"

  tags = {
    Name = "public_sub1"
  }
}
resource "aws_subnet" "pub-subnet2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.pub_sub2
  availability_zone = "us-east-1b"

  tags = {
    Name = "public_sub2"
  }
}
resource "aws_subnet" "pvt-subnet1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.pvt_sub1
  availability_zone = "us-east-1a"
  tags = {
    Name = "private_sub1"
  }
}
resource "aws_subnet" "pvt-subnet2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.pvt_sub2
  availability_zone = "us-east-1b"

  tags = {
    Name = "private_sub2"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "IG_task1"
  }
}

resource "aws_route_table" "pub-RT" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "public_routeTable"
  }
}
resource "aws_route_table_association" "public_sub1" {
  subnet_id      = aws_subnet.pub-subnet1.id
  route_table_id = aws_route_table.pub-RT.id
}

resource "aws_route_table_association" "public_sub2" {
  subnet_id      = aws_subnet.pub-subnet2.id
  route_table_id = aws_route_table.pub-RT.id
}

resource "aws_nat_gateway" "NAT" {
  connectivity_type = "private"
  subnet_id         = aws_subnet.pub-subnet1.id
}

resource "aws_route_table" "pvt-RT" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NAT.id
  }

  tags = {
    Name = "private_routeTable"
  }
}

resource "aws_route_table_association" "private_sub1" {
  subnet_id      = aws_subnet.pvt-subnet1.id
  route_table_id = aws_route_table.pvt-RT.id
}
resource "aws_route_table_association" "private_sub2" {
  subnet_id      = aws_subnet.pvt-subnet2.id
  route_table_id = aws_route_table.pvt-RT.id
}
