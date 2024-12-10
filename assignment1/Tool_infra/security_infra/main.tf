resource "aws_security_group" "public_sg" {
  name        = "public"
  description = "Allow inbound traffic for public SG"
  vpc_id      = var.vpc_tool

  ingress {
    description = "all traffic"
    from_port   = var.all_traffic_port
    to_port     = var.all_traffic_port
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "ssh Port"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = var.all_traffic_port
    to_port     = var.all_traffic_port
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public_sg"
  }
}
resource "aws_security_group" "private_sg" {
  name        = "private01"
  description = "Allow inbound traffic for private SG"
  vpc_id      = var.vpc_tool

  ingress {
    description = "all traffic"
    from_port   = var.all_traffic_port
    to_port     = var.all_traffic_port
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "ssh Port"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = var.all_traffic_port
    to_port     = var.all_traffic_port
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private_sg1"
  }
}
resource "aws_network_acl" "pvt_nacl" {
  vpc_id = var.vpc_tool

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = var.nacl_action
    cidr_block = "0.0.0.0/0"
    from_port  = var.all_traffic_port
    to_port    = var.all_traffic_port
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = var.nacl_action
    cidr_block = "0.0.0.0/0"
    from_port  = var.all_traffic_port
    to_port    = var.all_traffic_port
  }

  tags = {
    Name = "private_nacl"
  }
}
resource "aws_network_acl_association" "private_sub1_asso" {
  network_acl_id = aws_network_acl.pvt_nacl.id
  subnet_id      = var.pvt_sub1_id
}
resource "aws_network_acl_association" "private_sub2_asso" {
  network_acl_id = aws_network_acl.pvt_nacl.id
  subnet_id      = var.pvt_sub2_id
}
