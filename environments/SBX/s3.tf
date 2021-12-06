module "s3" {
    source = "../../modules/s3"
    bucket_name = "rady-810221380564"
    environment = var.environment
}