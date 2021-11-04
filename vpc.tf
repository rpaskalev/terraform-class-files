

resource "aws_subnet" "my_subnet_1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.26.10.0/24"
  availability_zone = "ypur-availability-zone"

  tags = {
    Name = "subnet-1"
  }
}

resource "aws_subnet" "my_subnet_2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.26.20.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "subnet-2"
  }
}

resource "aws_network_interface" "ziyotek_1" {
  subnet_id = aws_subnet.my_subnet_1.id

  tags = {
    Name = "primary_network_interface_1"
  }
}

resource "aws_network_interface" "ziyotek_2" {
  subnet_id = aws_subnet.my_subnet_2.id

  tags = {
    Name = "primary_network_interface_2"
  }
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "172.26.0.0/16"

  tags = {
    Name = "rady_development"
  }
}


resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow ALL inbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description = "All from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
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