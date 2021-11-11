variable "ami_id" {
  type    = string
  default = "ami-02e136e904f3da870"
}

variable "availability_zone" {
  type    = string
  default = "us-east-1a"
}
variable "key_blahblahblah" {
  default = "rady_key_new"
}
variable "instace_type" {
  default = "t2.micro"
}

variable "device_index" {
  type    = number
  default = 0
}

variable "instance_name" {
  default = ""
}

variable "bucket_name" {
  default = ""
}

variable "acl_type" {
  description = "It defines the acl for the s3 bucket. Allowed values are private, public-read, public-read-write, aws-exec-read, authenticated-read, and log-delivery-write"
  default     = "private"
}

variable "environment" {
  default = "SBX1"
}

variable "subnet_1_cidr" {
  default = "172.26.10.0/24"
}

variable "subnet_2_cidr" {
  default = "172.26.20.0/24"
}

variable "subnet_1_name" {
  default = "public_subnet"
}

variable "ebs_optimized" {
  type    = bool
  default = null
}

variable "ec2_tags" {
  type = map(any)
  default = {
    Name        = "my_ec2",
    Environment = "dev"
  }
}

variable "subnet_tags" {
    type = map
    default = {
        VPC = "dev_vpc"
        Environment = "Dev"
    } 
}

variable "interface_tags" {
  type = map
  default = {
      environment = "Dev"
  }
}

variable "vpc_cidr_block" {
  default = "172.26.0.0/16"
}

variable "ingress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  type        = list(string)
  default     = ["0.0.0.0/0"/*"10.10.0.0/24"*/]
}