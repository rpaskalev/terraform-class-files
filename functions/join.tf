locals {
    bucket_names = ["${local.company}", "${local.department}", "${local.instructor}"]
    company = "ziyotek"
    department = "cloud"
    instructor = "rady"
}

resource "aws_s3_bucket" "iqies-offline-build" {
  bucket = join("-", local.bucket_names)
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  lifecycle_rule {
    abort_incomplete_multipart_upload_days = 7
    enabled                                = true
    id                                     = "delete_60_day_old_versions"
    tags                                   = {}
    expiration {
      days                         = 0
      expired_object_delete_marker = true
    }
    noncurrent_version_expiration {
      days = 60
    }
  }

  # lifecycle {
  #   ignore_changes = [bucket]
  # }
}

variable "environment" {
  #default = "dev"
  default = "prod"
}