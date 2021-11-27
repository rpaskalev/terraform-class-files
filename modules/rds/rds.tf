resource "aws_db_instance" "default" {
  allocated_storage                   = var.storage
  storage_type                        = "gp2"
  engine                              = "postgres"
  engine_version                      = "10.15"
  instance_class                      = var.instance_class 
  name                                = "ziyotek-${var.environment}"
  username                            = "ziyotekadmin"
  password                            = random_password.database_password.result
  vpc_security_group_ids              = var.vpc_security_group #[aws_security_group.allow_all.id]
  skip_final_snapshot                 = true
  iam_database_authentication_enabled = false
  db_subnet_group_name                = aws_db_subnet_group.default.id
}

resource "aws_db_subnet_group" "default" {
  name       = "postgres-subnet-group-${var.environment}"
  subnet_ids = var.subnet_ids #[aws_subnet.my_subnet_1.id, aws_subnet.my_subnet_2.id]

   tags = {
    Environment = var.environment
  }
}

resource "random_password" "database_password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "aws_ssm_parameter" "dev_db_secret" {
  name        = "/ziyotek/class/database/password-${var.environment}"
  description = "The DB password"
  type        = "SecureString"
  key_id      = aws_kms_key.database_key.key_id
  value       = random_password.database_password.result

  tags = {
    Environment = var.environment
  }
}

resource "aws_kms_key" "database_key" {
  description             = "KMS key to be used for db encryption"
  deletion_window_in_days = 7
}