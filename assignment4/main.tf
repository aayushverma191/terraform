terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}



provider "aws" {
  region = "us-east-1"
}
########################################
#               add backend
#
######################################
##vpc
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/18"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "ninja-vpc"
  }
}
#pub subnet
resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "public-sub"
  }
}
#pvt subnet1
resource "aws_subnet" "pvt-subnet1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-sub1"
  }
}
#pvt subnet2
resource "aws_subnet" "pvt-subnet2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "us-east-1b"
  #associate_public_ip_address = "true"

  tags = {
    Name = "private-sub2"
  }
}
#internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

#elastic ip
resource "aws_eip" "lb" {
  domain = "vpc"
}

#nat gateway
resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.public-subnet.id

  tags = {
    Name = "gw NAT"
  }

  depends_on = [aws_internet_gateway.igw]
}

#####route table public
resource "aws_route_table" "pubRT" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "pubRT"
  }
}
#####route table pvt
resource "aws_route_table" "pvt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw.id
  }

  tags = {
    Name = "pvtRT"
  }
}
#public subnet association
resource "aws_route_table_association" "pub" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.pubRT.id
}
#pvt subnet association
resource "aws_route_table_association" "pvt-subnet1" {
  subnet_id      = aws_subnet.pvt-subnet1.id
  route_table_id = aws_route_table.pvt.id
}
resource "aws_route_table_association" "pvt-subnet2" {
  subnet_id      = aws_subnet.pvt-subnet2.id
  route_table_id = aws_route_table.pvt.id
}
#######################################################################
####security group

resource "aws_security_group" "public_sgroups" {
  name        = "public_sg"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public-Sgroup"
  }
}
resource "aws_security_group" "private_sg" {
  name        = "private_sg"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private_sg"
  }
}
###### nacl
resource "aws_network_acl" "naclpvt" {
  vpc_id = aws_vpc.main.id

  # Egress rule to allow all outbound traffic
  egress {
    protocol   = "all"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  # Ingress rule to allow all inbound traffic
  ingress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "pvt nacl"
  }
}
###### nacl association pvt1
resource "aws_network_acl_association" "pvt1" {
  network_acl_id = aws_network_acl.naclpvt.id
  subnet_id      = aws_subnet.pvt-subnet1.id
}

###### nacl association pvt2
resource "aws_network_acl_association" "pv2" {
  network_acl_id = aws_network_acl.naclpvt.id
  subnet_id      = aws_subnet.pvt-subnet2.id
}

########################################################################

#####compute module

resource "aws_instance" "public-instance" {
  ami                         = "ami-0e2c8caa4b6378d8c"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public-subnet.id
  associate_public_ip_address = "true"
  security_groups = [
    aws_security_group.public_sgroups.id
  ]

  tags = {
    Name = "bastion_host"
  }
}
resource "aws_instance" "private-instance1" {
  ami                         = "ami-0e2c8caa4b6378d8c"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.pvt-subnet1.id
  associate_public_ip_address = "false"
  security_groups = [
    aws_security_group.private_sg.id
  ]

  tags = {
    Name = "database1"
  }
}
resource "aws_instance" "private-instance2" {
  ami                         = "ami-0e2c8caa4b6378d8c"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.pvt-subnet2.id
  associate_public_ip_address = "false"
  security_groups = [
    aws_security_group.private_sg.id
  ]
  tags = {
    Name = "database2"
  }
}

########################################################################################
##  Target Group
#####################
resource "aws_lb_target_group" "target" {
  name     = "ninja-target"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  health_check {
    path                = "/"
    interval            = 280
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 10
    matcher             = "200-299"
  }
}

resource "aws_lb_target_group_attachment" "tg_attachment_private_instance1" {
  target_group_arn = aws_lb_target_group.target.arn
  target_id        = aws_instance.private-instance1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg_attachment_private_instance2" {
  target_group_arn = aws_lb_target_group.target.arn
  target_id        = aws_instance.private-instance2.id
  port             = 80
}


########################################################################################
##  Auto Load Balancer
##################################


resource "aws_lb" "ninja-alb" {
  name               = "mysql-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [
    aws_security_group.private_sg.id
  ]
  subnets            = [ 
    aws_subnet.public-subnet.id,
    aws_subnet.pvt-subnet2.id
  ]

  enable_deletion_protection = false
}

 ########################################################################################
##  Auto Load Balancer listner
##################################

resource "aws_lb_listener" "my_alb_listener" {
 load_balancer_arn = aws_lb.ninja-alb.arn
 port              = "80"
 protocol          = "HTTP"

 default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target.arn
  }
}
