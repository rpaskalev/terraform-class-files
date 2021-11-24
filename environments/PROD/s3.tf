module "s3" {
    source = "../../modules/s3"
    environment = "prod"
    bucket_name = "rady-810221380564"
}