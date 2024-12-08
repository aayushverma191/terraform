variable "region_name" {
  type        = string
  default     = "us-east-1"
  description = "enter region name"
}
variable "vpc_cidr_1" {
  type        = string
  default     = "10.0.0.0/20"
  description = "enter vpc CIDR"
}
variable "public_subnet1" {
  type        = string
  default     = "10.0.1.0/24"
  description = "enter public subnet1 CIDR"
}
variable "public_subnet2" {
  type        = string
  default     = "10.0.2.0/24"
  description = "enter public subnet2 CIDR"
}
variable "private_subnet1" {
  type        = string
  default     = "10.0.3.0/24"
  description = "enter private subnet1 CIDR"
}
variable "private_subnet2" {
  type        = string
  default     = "10.0.4.0/24"
  description = "enter private subnet2 CIDR"
}
variable "in_sg_port" {
  type        = string
  default     = 22
  description = "enter public sg inbound port"
}
variable "out_sg_port" {
  type        = string
  default     = 0
  description = "enter private sg outbound port"
}
variable "pubin_sg_port" {
  type        = string
  default     = 22
  description = "enter private sg inbound port"
}
variable "pubout_sg_port" {
  type        = string
  default     = 0
  description = "enter public sg outbound port"
}
variable "traffic_protocol" {
  type        = string
  default     = "-1"
  description = "enter the portocol for all traffic "
}
variable "protocol_tcp" {
  type        = string
  default     = "tcp"
  description = "enter the portocol for tcp traffic"
}
variable "ami_id_instance" {
  type        = string
  default     = "ami-0e2c8caa4b6378d8c"
  description = "description"
}
variable "insta_type" {
  type        = string
  default     = "t2.micro"
  description = "description"
}
variable "public_name_instance" {
  type        = string
  default     = "public-instance"
  description = "description"
}
variable "private_name_instance" {
  type        = string
  default     = "private-instance"
  description = "description"
}
