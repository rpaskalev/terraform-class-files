

resource "aws_s3_bucket" "iqies_my_first_resourse" {
  bucket = "${var.bucket_name}-${data.aws_region.current.id}"
  acl    = var.acl_type

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }

    provisioner "local-exec" {
    when    = destroy
    #command = "echo ${self.id} > testfile.txt"
    command = "aws s3 rm s3://${self.id} --recursive"
  }
}

