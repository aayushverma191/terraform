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
