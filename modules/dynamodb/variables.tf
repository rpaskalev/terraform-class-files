variable "environment" {}

variable "table_name" {
    description = "Name of the table to use for terraform s3 state lock"
    default = "terraform-lock"
}

variable "hash_key" {
    default = "LockID"
}

variable "read_capacity" {
    default = 20
}

variable "write_capacity" {
    default = 20
}

variable "attribute_name" {
    default = "LockID"
}

variable "attribute_type" {
    default = "S"
}