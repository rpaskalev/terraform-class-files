# Uncomment thos resource if you need to create an s3 backend end for the state file and add a lock: 
#resource "aws_dynamodb_table" "backend_s3_lock" {
#   name             = "terraform-lock"
#   hash_key         = "LockID"
#   read_capacity = 20
#   write_capacity = 20

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }