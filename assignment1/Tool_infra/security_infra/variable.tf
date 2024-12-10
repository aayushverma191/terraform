variable "vpc_tool" {
  type = string
}
variable "pvt_sub1_id" {
  type = string
}
variable "pvt_sub2_id" {
  type = string
}
variable "all_traffic_port" {
  type        = string
  default     = 0
  description = "Inbound/outbound rule for all traffic from/to port "
}
variable "ssh_port" {
  type        = string
  default     = 22
  description = "Inbound rule for ssh port from/to port "
}
variable "nacl_action" {
  type        = string
  default     = "allow"
  description = "description"
}


