module "task2" {
  source   = "./task2"
  region   = var.region_name
  vpc_cidr = var.vpc_cidr_1
  pub_sub1 = var.public_subnet1
  pub_sub2 = var.public_subnet2
  pvt_sub1 = var.private_subnet1
  pvt_sub2 = var.private_subnet2
}
module "security_module" {
  source               = "./security"
  vpc_ninja            = module.task2.vpc-id
  pvt_in_sg_port       = var.in_sg_port
  pvt_out_sg_port      = var.out_sg_port
  pub_in_sg_port       = var.pubin_sg_port
  pub_out_sg_port      = var.pubout_sg_port
  all_traffic_protocol = var.traffic_protocol
  tcp_protocol         = var.protocol_tcp
}
module "instance_module" {
  source            = "./compute"
  ami_id            = var.ami_id_instance
  instance_type     = var.insta_type
  pub_instance_name = var.public_name_instance
  pvt_instance_name = var.private_name_instance
  #vpc_ninja         = module.task2.vpc-id
  pub_subnet_id = module.task2.pub_subnet1
  pvt_subnet_id = module.task2.pvt_subnet1
  pub_sg        = module.security_module.public-sg
  pvt_sg        = module.security_module.private-sg
}
