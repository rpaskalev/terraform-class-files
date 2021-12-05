resource "aws_subnet" "my_subnet_1" {
  vpc_id            = var.vpc_id 
  cidr_block        = "10.10.10.0/24"
  availability_zone = "us-east-1a"
    tags = {
    Environment = var.environment
  }
}


resource "aws_subnet" "my_subnet_2" {
  vpc_id            = var.vpc_id 
  cidr_block        = "10.10.20.0/24"
  availability_zone = "us-east-1b"
    tags = {
    Environment = var.environment
  }
}


