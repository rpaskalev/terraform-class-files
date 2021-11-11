#this resource will create a separate ec2 instance in th edefault VPC. It will error is a default VPC doesnt exist. 

resource "aws_instance" "web" {
  ami = var.ami_id

  subnet_id                   = aws_subnet.my_subnet_1.id
  associate_public_ip_address = true
  # below we have 2 ways to add user data - directly or using the "file" function:
  # user_data = <<EOF
  # #!/bin/bash
  # sudo yum update -y
  # sudo yum install -y httpd
  # sudo systemctl start httpd.service
  # # sudo systemctl enable httpd.service
  # sudo echo "<h1> At $(hostname -f) </h1>" > /var/www/html/index.html
  # EOF                   

  user_data = file("userdata.sh")

  iam_instance_profile = aws_iam_instance_profile.s3_profile.id
  ebs_optimized        = var.ebs_optimized

  key_name      = aws_key_pair.ec2_key_pair.key_name
  instance_type = var.instace_type

  # Security group must be declared in the network_interface_id block if we are adding that parameter.
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags                   = var.ec2_tags
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "training" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.my_subnet_1.id
  route_table_id = aws_route_table.training.id
}
