module "ec2" {
    source = "../modules/ec2"
    environment = var.environment
    subnet_id = module.subnets.subnet_1_id
    vpc_security_group = [module.security_group.standard_sg]
    instance_profile = module.iam.instance_profile
    user_data = file("../files/codedeployagent.sh")
}

