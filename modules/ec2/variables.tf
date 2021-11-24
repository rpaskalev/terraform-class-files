variable "environment" {}

variable "ebs_optimized" {
    default = false
}

variable "key_name" {
    default = null
}

variable "instace_type" {
    default = "t2.micro"
}

variable "vpc_security_group" {
    default = ""
}

variable "subnet_id" {
    default = ""
}