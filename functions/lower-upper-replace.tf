# locals {
#   not_prod = "${lower("HIDS-ADO4")}-${lower(replace(var.formula, "DEV", "PROD"))}-app_data_mgt-sg"
#   prod     = "HIDS-ADO4-PROD-app_data_mgt-sg"
# }

# resource "aws_s3_bucket" "known_issues" {
#   bucket = "${local.not_prod}-known-issues"
#   acl    = "private"

#   lifecycle {
#     ignore_changes = [bucket]
#   }
# }

# variable "formula" {
#   default = "PROD-DEV-EXECUTION"
# }