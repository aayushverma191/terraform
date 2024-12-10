output "pub-instance-id" {
  value       = aws_instance.public_instance.id
  description = "print the public instance id"
}
output "instance_public_ip" {
  value       = aws_instance.public_instance.public_ip
  description = "Public IP address of the pub instance"
}
output "pvt-instance1-id" {
  value       = aws_instance.private_instance1.id
  description = "print the private instance id"
}
output "pvt-instance2-id" {
  value       = aws_instance.private_instance2.id
  description = "print the private instance id"
}
