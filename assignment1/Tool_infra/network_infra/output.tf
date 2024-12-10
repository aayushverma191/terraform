output "vpc-id" {
  value       = aws_vpc.tool_vpc.id
  description = "description"
}
output "public_sub-id" {
  value       = aws_subnet.public_sub.id
  description = "description"
}

output "pvt_sub1-id" {
  value       = aws_subnet.private_sub1.id
  description = "description"
}
output "pvt_sub2-id" {
  value       = aws_subnet.private_sub2.id
  description = "description"
}

