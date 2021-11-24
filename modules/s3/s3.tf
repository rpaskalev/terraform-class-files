resource "aws_s3_bucket" "iqies_my_first_resourse" {
  bucket = "${var.bucket_name}-${var.environment}"
  acl    = var.acl_type
  force_destroy = true

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = var.sse_algorithm
      }
    }
  }

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

