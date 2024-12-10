variable "vpc-cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "enter the CIDR of VPC"
}
variable "region-name" {
  type        = string
  default     = "us-east-1"
  description = "enter the Region name"
}
variable "public-sub1-CIDR" {
  type        = string
  default     = "10.0.1.0/24"
  description = "enter the CIDR of public subnet"
}
variable "private-sub1-CIDR" {
  type        = string
  default     = "10.0.2.0/24"
  description = "enter the CIDR of private subnet1"
}
variable "private-sub2-CIDR" {
  type        = string
  default     = "10.0.3.0/24"
  description = "enter the CIDR of private subnet2"
}
variable "availability-zone01" {
  type        = string
  default     = "us-east-1a"
  description = "enter the availability zone01"
}
variable "availability-zone02" {
  type        = string
  default     = "us-east-1b"
  description = "enter the availability zone02"
}
variable "traffic_port" {
  type        = string
  default     = 0
  description = "Inbound/outbound rule for all traffic from/to port "
}
variable "ssh_conection_port" {
  type        = string
  default     = 22
  description = "Inbound rule for ssh port from/to port "
}
variable "action-nacl" {
  type        = string
  default     = "allow"
  description = "traffic allow /deny"
}
variable ami-id {
  type        = string
  default     = "ami-0e2c8caa4b6378d8c"
  description = "enter AMI-ID of instance"
}
variable instance-type {
  type        = string
  default     = "t2.micro"
  description = "enter instnace type"
}
variable pub-instance-name {
  type        = string
  default     = "bastion-host"
  description = "public instance name"
}
variable pvt-instance1-name {
  type        = string
  default     = "database_server1"
  description = "description"
}
variable pvt-instance2-name {
  type        = string
  default     = "database_server2"
  description = "description"
}
variable key-name {
  type        = string
  default     = "nvirinia"
  description = "enter key pair name"
}
