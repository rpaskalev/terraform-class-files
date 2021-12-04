resource "aws_dynamodb_table" "backend_s3_lock" {
  name             = "${var.table_name}-${var.environment}" 
  hash_key         = var.hash_key 
  read_capacity = var.read_capacity
  write_capacity = var.write_capacity

  attribute {
    name = var.attribute_name 
    type = var.attribute_type 
  }
}