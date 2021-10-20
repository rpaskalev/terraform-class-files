
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" 
      version = "~> 3.45"
    }
  }
# Uncomment this block if you wwant to test and a remote backend in s3 ( your bucket must exist or be created):
#  backend "s3" {
#    bucket = "your-s3-bucket-name"
#    key    = "tfstate"
#    region = "us-east-1"
    # dynamodb_table = ""
    # encrypt = true
#  }
}

provider "aws" {
  region     = "us-east-1"
}
