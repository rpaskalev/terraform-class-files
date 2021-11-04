

resource "aws_s3_bucket" "iqies_my_first_resourse" {
  bucket = "your-bucket-name"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
