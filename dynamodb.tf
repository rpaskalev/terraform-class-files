resource "aws_dynamodb_table" "backend_s3_lock" {
  name             = "terraform-lock"
  hash_key         = "LockID"
  read_capacity = 20
  write_capacity = 20

  attribute {
    name = "LockID"
    type = "S"
  }
}