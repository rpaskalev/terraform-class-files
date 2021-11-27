module "s3" {
    source = "../../modules/s3"
    environment = var.environment
    bucket_name = "rady-810221380564"
}