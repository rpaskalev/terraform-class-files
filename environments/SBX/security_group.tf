module "security_group" {
    source = "../../modules/security_groups"
    environment = var.environment
    vpc_id = module.vpc.vpc_id
}