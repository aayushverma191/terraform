resource "aws_instance" "public_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.pub_subnet_id
  associate_public_ip_address = "true"
  key_name        = var.key_name 
  security_groups = [
    var.pub_sg
  ]
  tags = {
    Name = var.pub_instance_name
    key = "aws"
  }
}
resource "aws_instance" "private_instance1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.pvt_subnet1_id
  key_name        = var.key_name 
  security_groups = [
    var.pvt_sg
  ]
  associate_public_ip_address = "false"
  tags = {
    Name = var.pvt_instance1_name
    key = "aws"
  }
}
resource "aws_instance" "private_instance2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.pvt_subnet2_id
  key_name        = var.key_name 
  security_groups = [
    var.pvt_sg
  ]
  associate_public_ip_address = "false"
  tags = {
    Name = var.pvt_instance2_name
    key = "aws"
  }
}
