
variable "environment" {}

variable "storage" {
    default = 10
}

variable "instance_class" {
    default = "db.t3.micro"
}

variable "vpc_security_group" {}

variable "subnet_ids" {
    default = []
}