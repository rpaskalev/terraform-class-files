#this resource will create a separate ec2 instance in th edefault VPC. It will error is a default VPC doesnt exist. 

resource "aws_instance" "web" {
  ami               = var.ami_id
  #availability_zone = var.availability_zone
  #user_data = 


  iam_instance_profile  = aws_iam_instance_profile.s3_profile.id


  ebs_optimized = var.ebs_optimized

  key_name      = var.key_blahblahblah
  instance_type = var.instace_type

  # Security group must be declared in the network_interface_id block if we are adding that parameter.
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  tags = var.ec2_tags

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
