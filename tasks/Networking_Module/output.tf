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
