output "vpc-id" {
  value = aws_vpc.vpc.id
  description = "print ID of vpc"
}
output "pub_subnet1" {
  value = aws_subnet.pub-subnet1.id
  description = "print ID of pub-subnet1"
}
output "pub_subnet2" {
  value = aws_subnet.pub-subnet2.id
  description = "print ID of pub-subnet2"
}
output "pvt_subnet1" {
  value = aws_subnet.pvt-subnet1.id
  description = "print ID of pvt-subnet1"
}
output "pvt_subnet2" {
  value = aws_subnet.pvt-subnet2.id
  description = "print ID of pvt-subnet2"
}
output "pub_route-table" {
  value = aws_route_table.pub-RT.id
  description = "print ID of pvt-subnet2"
}
output "pvt_route-table" {
  value = aws_route_table.pvt-RT.id
  description = "print ID of pvt-subnet2"
}
