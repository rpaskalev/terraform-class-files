
module "rds" {
    source = "../../modules/rds"
    environment = var.environment
    vpc_security_group = [module.security_group.standard_sg]
    subnet_ids = [module.subnets.subnet_1_id, module.subnets.subnet_2_id ]
}
