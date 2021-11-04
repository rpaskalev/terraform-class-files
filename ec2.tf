#this resource will create a separate ec2 instance in th edefault VPC. It will error is a default VPC doesnt exist. 

resource "aws_instance" "web" {
  ami               = "your-ami"
  availability_zone = "your-availability-zone"
  

  key_name      = "your-key"
  instance_type = "t2.micro"

  # Security group must be declared in the network_interface_id block if we are adding that parameter.
  #vpc_security_group_ids = [aws_security_group.allow_all.id]

  network_interface {
    network_interface_id = aws_network_interface.ziyotek_1.id
    device_index         = 0
  }

  tags = {
    Name = "your-name"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "training" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.my_subnet_1.id
  route_table_id = aws_route_table.training.id
}