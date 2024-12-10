variable "ami_id" {
  type        = string
  default     = "ami-0e2c8caa4b6378d8c"
  description = "enter AMI-ID of instance"
}
variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "enter instnace type"
}
variable "pub_instance_name" {
  type        = string
  default     = "bastion-host"
  description = "public instance name"
}
variable "pvt_instance1_name" {
  type        = string
  default     = "database_server1"
  description = "description"
}
variable "pvt_instance2_name" {
  type        = string
  default     = "database_server2"
  description = "description"
}
variable "pub_sg" {
  type = string
}
variable "pvt_sg" {
  type = string
}
variable "pub_subnet_id" {
  type = string
}
variable "pvt_subnet1_id" {
  type = string
}
variable "pvt_subnet2_id" {
  type = string
}
variable key_name {
  type        = string
  default     = "nvirinia"
  description = "enter key pair name"
}
