module "instance_profile" {
    source = "../../modules/iam"
    environment = var.environment
    s3_bucket = module.s3.s3_bucket_id
}