
locals {
  force_destroy = true
  bucket_name = "${var.bucket_name}-${var.environment}"
}

resource "aws_s3_bucket" "iqies_my_first_resourse" {
  bucket = local.bucket_name
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
  bucket = "${local.bucket_name}-2"
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


