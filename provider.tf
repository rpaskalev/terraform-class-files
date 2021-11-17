
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.45"
    }
  }
  # Uncomment this block if you wwant to test and a remote backend in s3 and add state lock in dynamodb
  #(your bucket must exist already). Note that dynamodb_table below must be the same as your dynamodb resource table name:
  #  backend "s3" {
  #     bucket = "your-existing-bucket"
  #     key    = "ec2-example/terraform.tfstate"
  #     region = "us-east-1"
  #     #dynamodb_table = "terraform-lock"
  #     #encrypt = true
  #   }
}

provider "aws" {
  region = "us-east-1"
}
