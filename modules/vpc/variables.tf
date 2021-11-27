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

variable "availability_zone_1" {
    default = "us-east-1a"
}

variable "availability_zone_2" {
    default = "us-east-1b"
}
variable "vpc_id" {}
