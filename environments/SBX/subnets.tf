module "subnets" {
    source = "../../modules/vpc"
    environment = var.environment
    vpc_id = module.subnets.vpc_id
    subnet_1_cidr = "10.10.10.0/24"
    subnet_2_cidr = "10.10.20.0/24"
    vpc_cidr_block = "10.10.0.0/16"
}