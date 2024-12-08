output "public-sg" {
  value = aws_security_group.public_sg.id
  description = "print public sg id"
}
output "private-sg" {
  value = aws_security_group.private_sg.id
  description = "print private sg id"
}
