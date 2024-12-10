#create vpc
resource "aws_vpc" "tool_vpc" {
  cidr_block           = var.vpc_CIDR
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"

  tags = {
    Name = "Tool-VPC"
  }
}
#public-subnet-1
resource "aws_subnet" "public_sub" {
  vpc_id            = aws_vpc.tool_vpc.id
  cidr_block        = var.pub_sub1_CIDR
  availability_zone = var.az01

  tags = {
    Name = "public_subnet"
  }
}

#private-subnet-1
resource "aws_subnet" "private_sub1" {
  vpc_id            = aws_vpc.tool_vpc.id
  cidr_block        = var.pvt_sub1_CIDR
  availability_zone = var.az01

  tags = {
    Name = "private_subnet1"
  }
}
#private-subnet-2
resource "aws_subnet" "private_sub2" {
  vpc_id            = aws_vpc.tool_vpc.id
  cidr_block        = var.pvt_sub2_CIDR
  availability_zone = var.az02

  tags = {
    Name = "private_subnet2"
  }
}
#internet-gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.tool_vpc.id

  tags = {
    Name = "tool-internet-gw"
  }
}

#elastic ip for nat gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

#NAT-Gateway
resource "aws_nat_gateway" "NAT" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_sub.id

  tags = {
    Name = "tool-NAT-gw"
  }
}

#Public-Route_Table
resource "aws_route_table" "Public_RT" {
  vpc_id = aws_vpc.tool_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public_RouteTable"
  }
}

#public subnet associate
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_sub.id
  route_table_id = aws_route_table.Public_RT.id
}

#private-Route_Table
resource "aws_route_table" "private_RT" {
  vpc_id = aws_vpc.tool_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NAT.id
  }
  tags = {
    Name = "public_RouteTable"
  }
}

#private subnet1 associate
resource "aws_route_table_association" "private_subnet1_association" {
  subnet_id      = aws_subnet.private_sub1.id
  route_table_id = aws_route_table.private_RT.id
}

#private subnet2 associate
resource "aws_route_table_association" "private_subnet2_association" {
  subnet_id      = aws_subnet.private_sub2.id
  route_table_id = aws_route_table.private_RT.id
}

