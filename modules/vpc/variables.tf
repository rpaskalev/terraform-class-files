variable "environment" {}

variable "vpc_cidr_block" {
    default = "0.0.0.0/0"
}

variable "subnet_1_cidr" {
  default = ""
}

variable "subnet_2_cidr" {
  default = ""
}

variable "vpc_id" {}
