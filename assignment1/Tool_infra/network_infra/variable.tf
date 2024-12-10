variable "vpc_CIDR" {
  type        = string
  default     = "10.0.0.0/18"
  description = "enter the CIDR of VPC"
}
variable "region" {
  type        = string
  default     = "us-east-1"
  description = "enter the Region name"
}
variable "pub_sub1_CIDR" {
  type        = string
  default     = "10.0.1.0/24"
  description = "enter the CIDR of public subnet"
}
variable "pvt_sub1_CIDR" {
  type        = string
  default     = "10.0.2.0/24"
  description = "enter the CIDR of private subnet1"
}
variable "pvt_sub2_CIDR" {
  type        = string
  default     = "10.0.3.0/24"
  description = "enter the CIDR of private subnet2"
}
variable "az01" {
  type        = string
  default     = "us-east-1a"
  description = "enter the availability zone01"
}
variable "az02" {
  type        = string
  default     = "us-east-1b"
  description = "enter the availability zone02"
}
