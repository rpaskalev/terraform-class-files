# resource "aws_s3_bucket" "known_issues" {
#   count = length(regex("prod", var.environment)) > 0 ? 1 : 0
#   #count = length(regexall("^prod", var.environment)) > 0 ? 1 : 0

#   bucket = "${var.environment}-known-issues"
#   acl    = "private"

#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         sse_algorithm = "AES256"
#       }
#     }
#   }

#   website {
#     index_document = "index.html"
#   }

# }

# resource "aws_s3_bucket_policy" "known_issues" {
#   count = length(regex("prod", var.environment)) > 0 ? 1 : 0

#   bucket = aws_s3_bucket.known_issues[0].id

#   policy = <<POLICY
# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Principal": "*",
#             "Action": [
#                 "s3:GetObject",
#                 "s3:GetBucketPolicy",
#                 "s3:GetBucketWebsite"
#             ],
#             "Resource": [
#                 "arn:aws:s3:::${aws_s3_bucket.known_issues[0].id}",
#                 "arn:aws:s3:::${aws_s3_bucket.known_issues[0].id}/*"
#             ],
#             "Condition": {
#                 "StringEquals": {
#                     "aws:SourceVpc": ${jsonencode(var.all_vpc_ids)}
#                 }
#             }
#         }
#     ]
# }
# POLICY
# }

# variable "all_vpc_ids" {
#   default = [
#     "vpc-bbf74ac3", #dev
#     "vpc-fa6b3a81", #prod
#     "vpc-261ea05d", #test
#     "vpc-0ad46972", #sbx
#     "vpc-e69c039d"  #impl
#   ]
# }

# variable "environment" {
#     #default = "dev"
#     default = "prod"
# }