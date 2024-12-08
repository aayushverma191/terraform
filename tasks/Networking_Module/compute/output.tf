output pub-instance-id {
  value       = aws_instance.public_instance.id
  description = "print the public instance id"
}
output pvt-instance-id {
  value       = aws_instance.private_instance.id
  description = "print the private instance id"
}
output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.public_instance.public_ip
}
