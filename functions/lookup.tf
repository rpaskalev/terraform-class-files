# resource "aws_instance" "web" {
#   ami = lookup(var.amis, var.region)

#   subnet_id                   = aws_subnet.my_subnet_1.id
#   associate_public_ip_address = true              
#   instance_type = "t2.micro"
#   vpc_security_group_ids = [aws_security_group.allow_all.id]
# }

# variable "amis" {
#   type = map
#   default = {
#       "us-east-1" = "ami-0739f8cdb239fe9ae"
#       "us-west-2" = "ami-008b09448b998a562"
#       "us-east-2" = "ami-0ebc8f6f580a04647"
#   }
# }

# variable "region" {
#   default = "us-east-1"
# }
# resource "aws_vpc" "my_vpc" {
#   cidr_block = "10.10.0.0/16"
# }

# resource "aws_subnet" "my_subnet_1" {
#   vpc_id            = aws_vpc.my_vpc.id
#   cidr_block        = "10.10.10.0/24"
#   availability_zone = "us-east-1a"
# }

# resource "aws_security_group" "allow_all" {
#   name        = "allow_all"
#   description = "Allow ALL inbound traffic"
#   depends_on = [aws_vpc.my_vpc]
#   vpc_id      = aws_vpc.my_vpc.id

#   ingress {
#     description = "All from VPC"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }