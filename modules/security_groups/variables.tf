variable "environment" {}
variable "sg_name" {
    default = ""
}

variable "vpc_id" {
    default = ""
}

variable "ingress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}