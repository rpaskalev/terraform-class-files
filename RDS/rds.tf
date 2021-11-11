
    resource "aws_db_instance" "GoGreen" {
    allocated_storage    = 20
    storage_type         = "gp2"
    engine               = "mysql"
    engine_version       = "8.0.20"
    instance_class       = "db.t2.micro"
    name                 = "mydb"
    username             = "cloud"
    password             = "password"
    #parameter_group_name = "default.mysql5.7"
    #storage_encrypted    = "true"
    availability_zone    = "us-east-1a"
    backup_retention_period  = 7
    backup_window = "21:00-23:50"
    skip_final_snapshot  = true
    copy_tags_to_snapshot = false
    #enabled_cloudwatch_logs_exports = "error"
    iam_database_authentication_enabled = true
    #kms_key_id    = "arn:aws:kms:us-west-1:889473501810:key/98c0efcc-8839-41f2-abef-fbf21d6b7dc1"
    #maintenance_window    = "01:00-03:50"
    port  = "3306"
    db_subnet_group_name = aws_db_subnet_group.rds-subnet-group.id
    vpc_security_group_ids = [aws_security_group.rds.id]
    tags  = {
        Name  = "GoGreen Data Base"
    }
    }

    resource "aws_db_subnet_group" "rds-subnet-group" {
    name       = "main"
    subnet_ids = ["subnet-c1d8b9f0", "subnet-6b729f27"]

    tags = {
        Name = "My DB subnet group"
    }
    }
resource "aws_security_group" "rds" {
  name        = "allow_all"
  vpc_id      = "vpc-03137a7e"

  ingress {
    description = "All from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all"
  }
}