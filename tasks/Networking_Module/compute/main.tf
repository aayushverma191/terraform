resource "aws_instance" "public_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.pub_subnet_id
  associate_public_ip_address = "true"
  security_groups = [
    var.pub_sg
  ]
  tags = {
    Name = var.pub_instance_name
  }
}
resource "aws_instance" "private_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.pvt_subnet_id
  security_groups = [
    var.pvt_sg
  ]
  associate_public_ip_address = "false"
  tags = {
    Name = var.pvt_instance_name
  }
}
