module "security_group" {
    source = "../../modules/security_groups"
    environment = var.environment
    vpc_id = module.subnets.vpc_id
}