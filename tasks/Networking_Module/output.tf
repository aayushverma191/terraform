output "vpc-id" {
  value       = module.task2.vpc-id
  description = "print ID of vpc"
}
output "pub_subnet1" {
  value       = module.task2.pub_subnet1
  description = "print ID of pub-subnet1"
}
output "pub_subnet2" {
  value       = module.task2.pub_subnet2
  description = "print ID of pub-subnet2"
}
output "pvt_subnet1" {
  value       = module.task2.pvt_subnet1
  description = "print ID of pvt-subnet1"
}
output "pvt_subnet2" {
  value       = module.task2.pvt_subnet2
  description = "print ID of pvt-subnet2"
}
output "pub_route-table" {
  value       = module.task2.pub_route-table
  description = "print ID of pvt-subnet2"
}
output "pvt_route-table" {
  value       = module.task2.pvt_route-table
  description = "print ID of pvt-subnet2"
}
output "public-sg" {
  value       = module.security_module.public-sg
  description = "print public sg id"
}
output "private-sg" {
  value       = module.security_module.private-sg
  description = "print private sg id"
}
output "pub-instance-id" {
  value       = module.instance_module.pub-instance-id
  description = "description"
}
output "pvt-instance-id" {
  value       = module.instance_module.pvt-instance-id
  description = "description"
}
output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = module.instance_module.instance_public_ip
}
