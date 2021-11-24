module "security_group" {
    source = "../../modules/security_groups"
    environment = var.environment
}