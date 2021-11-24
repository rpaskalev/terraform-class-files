module "subnets" {
    source = "../../modules/subnets"
    environment = var.environment
    vpc_id = module.vpc.vpc_id
    subnet_1_cidr = "10.10.10.0/24"
    subnet_2_cidr = "10.10.20.0/24"
}