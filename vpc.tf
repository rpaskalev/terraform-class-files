resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = var.vpc_tags
}

resource "aws_subnet" "my_subnet_1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet_1_cidr
  availability_zone = "us-east-1a"

  tags = var.subnet_tags
}

resource "aws_subnet" "my_subnet_2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet_2_cidr
  availability_zone = "us-east-1b"

  tags = var.subnet_tags
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow ALL inbound traffic"
  depends_on = [aws_vpc.my_vpc]
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description = "All from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.ingress_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.sg_tags
}