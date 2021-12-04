
locals {
  force_destroy = true
  environment = var.environment
}

variable "bucket_reactor" {
  default = "reactor-bucket-1-rady1-1234567891011"
}

variable "bucket_report" {
  default = "reports-bucket-1-rady1-1234567891011"
}

resource "aws_s3_bucket" "iqies_my_first_resourse" {
  
  count = var.environment != "sbx" ? 1 : 0

  bucket = "${var.bucket_reactor}-${var.environment}"
  acl    = var.acl_type
  force_destroy = local.force_destroy

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = var.sse_algorithm
      }
    }
  }
}

resource "aws_s3_bucket" "iqies_my_second_resourse" {
  
  count = var.environment != "sbx" ? 1 : 0
#   ? = "if not true"
  bucket = "${var.bucket_report}-${var.environment}"
  acl    = var.acl_type
  force_destroy = local.force_destroy

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = var.sse_algorithm
      }
    }
  }
}


