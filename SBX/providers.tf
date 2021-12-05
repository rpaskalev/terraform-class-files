
provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "rady-bucket-1-0-0"
    key    = "dags/myfile"
    region = "us-east-1"
  }
}