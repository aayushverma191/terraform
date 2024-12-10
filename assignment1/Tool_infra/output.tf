output "vpc_id" {
  value       = module.network_module.vpc-id
  description = "print vpc id"
}
output "public_sub_id" {
  value       = module.network_module.public_sub-id
  description = "print public subnet"
}
output "pvt_sub1_id" {
  value       = module.network_module.pvt_sub1-id
  description = "print private subnet1"
}
output "pvt_sub2_id" {
  value       = module.network_module.pvt_sub2-id
  description = "print private subnet2"
}
output "public_sg_id" {
  value       = module.security_module.public_sg-id
  description = "print public security group"
}
output "pvt_sg_id" {
  value       = module.security_module.private_sg-id
  description = "print private security group"
}
output pub-instance-id {
  value       = module.compute_module.pub-instance-id 
  description = "print the public instance id"
}
output "instance_public_ip" {
  value       = module.compute_module.instance_public_ip
  description = "Public IP address of the pub instance"
}
output pvt-instance1-id {
  value       = module.compute_module.pvt-instance1-id
  description = "print the private instance id"
}
output pvt-instance2-id {
  value       = module.compute_module.pvt-instance2-id
  description = "print the private instance id"
}
