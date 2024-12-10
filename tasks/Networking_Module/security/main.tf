resource "aws_security_group" "public_sg" {
  vpc_id = var.vpc_ninja
  name   = "public_sg"

  ingress {
    from_port   = var.pub_in_sg_port
    to_port     = var.pub_in_sg_port
    protocol    = var.tcp_protocol
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = var.pub_out_sg_port
    to_port     = var.pub_out_sg_port
    protocol    = var.all_traffic_protocol
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "public_security_group"
  }
}

resource "aws_security_group" "private_sg" {
  vpc_id = var.vpc_ninja
  name   = "private_sg"

  ingress {
    from_port   = var.pvt_in_sg_port
    to_port     = var.pvt_in_sg_port
    protocol    = var.tcp_protocol
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = var.pvt_out_sg_port
    to_port     = var.pvt_out_sg_port
    protocol    = var.all_traffic_protocol
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "private_security_group"
  }
}
