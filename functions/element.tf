# locals {
#     bucket_names = ["bucket-${var.environment}-etl-test1", "bucket-${var.environment}-etl-test2"]
#     prod_bucket = "prod1-ready-rector-base-s3-bucket"
# }

# resource "aws_s3_bucket" "iqies-offline-build" {
#   count = length(local.bucket_names)
#   bucket = var.environment == "prod" ? local.prod_bucket : element(local.bucket_names, count.index)
#   acl    = "private"

#   versioning {
#     enabled = true
#   }

#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         sse_algorithm = "AES256"
#       }
#     }
#   }

#   lifecycle_rule {
#     abort_incomplete_multipart_upload_days = 7
#     enabled                                = true
#     id                                     = "delete_60_day_old_versions"
#     tags                                   = {}
#     expiration {
#       days                         = 0
#       expired_object_delete_marker = true
#     }
#     noncurrent_version_expiration {
#       days = 60
#     }
#   }

#   # lifecycle {
#   #   ignore_changes = [bucket]
#   # }
# }

# variable "environment" {
#   #default = "dev"
#   default = "prod"
# }