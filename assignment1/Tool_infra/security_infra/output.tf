output "public_sg-id" {
  value       = aws_security_group.public_sg.id
  description = "print public security group"
}
output "private_sg-id" {
  value       = aws_security_group.private_sg.id
  description = "print private security group"
}
