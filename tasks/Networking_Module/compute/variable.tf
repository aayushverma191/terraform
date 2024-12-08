variable ami_id {
  type        = string
  default     = "ami-0e2c8caa4b6378d8c"
  description = "enter AMI of the os/instnace"
}
variable instance_type {
  type        = string
  default     = "t2.micro"
  description = "enter the type of instance"
}
variable pub_subnet_id {
  type        = string
}
variable pvt_subnet_id {
  type        = string
}
variable pub_sg {
  type        = string
}
variable pvt_sg {
  type        = string
}
variable pub_instance_name {
  type        = string
}
variable pvt_instance_name {
  type        = string
}
