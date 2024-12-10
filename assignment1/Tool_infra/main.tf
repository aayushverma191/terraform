module "network_module" {
  source        = "./network_infra"
  vpc_CIDR      = var.vpc-cidr
  region        = var.region-name
  pub_sub1_CIDR = var.public-sub1-CIDR
  pvt_sub1_CIDR = var.private-sub1-CIDR
  pvt_sub2_CIDR = var.private-sub2-CIDR
  az01          = var.availability-zone01
  az02          = var.availability-zone02
}

module "security_module" {
  source           = "./security_infra"
  vpc_tool         = module.network_module.vpc-id
  pvt_sub1_id      = module.network_module.pvt_sub1-id
  pvt_sub2_id      = module.network_module.pvt_sub2-id
  all_traffic_port = var.traffic_port
  ssh_port         = var.ssh_conection_port
  nacl_action      = var.action-nacl
}
module "compute_module" {
  source = "./compute_infra"
  ami_id = var.ami-id
  instance_type = var.instance-type
  key_name = var.key-name
  pub_instance_name = var.pub-instance-name
  pvt_instance1_name = var.pvt-instance1-name
  pvt_instance2_name = var.pvt-instance2-name
  pub_subnet_id = module.network_module.public_sub-id
  pvt_subnet1_id = module.network_module.pvt_sub1-id
  pvt_subnet2_id = module.network_module.pvt_sub2-id
  pvt_sg = module.security_module.private_sg-id
  pub_sg = module.security_module.public_sg-id
}

