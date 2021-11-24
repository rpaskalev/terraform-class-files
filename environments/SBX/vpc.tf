module "vpc" {
    source = "../../modules/vpc"
    environment = var.environment
    vpc_cidr_block = "10.10.0.0/16"
}