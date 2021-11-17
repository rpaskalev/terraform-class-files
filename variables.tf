variable "vpc_cidr_block" {
  default = "172.26.0.0/16"
}

variable "vpc_tags" {
  type = map
  default = {
    Name = "ziytek-class"
    Environment = "dev"
  }
}

variable "subnet_1_cidr" {
  default = "172.26.10.0/24"
}

variable "subnet_2_cidr" {
  default = "172.26.20.0/24"
}

variable "key_blahblahblah" {
  default = null
}
variable "instance_type" {
  default = "t2.micro"
}

variable "device_index" {
  type    = number
  default = 0
}

variable "instance_name" {
  default = "ziyotek-class-instance"
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
        Name = "ziyotek-subnet"
        Environment = "Dev"
    } 
}

variable "ingress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  type        = list(string)
  default     = ["0.0.0.0/0"/*"10.10.0.0/24"*/]
}

variable "sg_tags" {
  type = map
  default = {
    Name = "ziyotek-sg"
  } 
}

variable "db_tags" {
  type = map
  default = {
    Name = "dav-database"
    Environment = "dev"
  }
}