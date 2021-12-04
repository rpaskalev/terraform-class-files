resource "aws_subnet" "my_subnet_1" {
  count = length(var.subnet_cidrs)
  vpc_id            = var.vpc_id 
  cidr_block        = var.subnet_cidrs[count.index]
  availability_zone = var.availability_zone_1

    tags = {
    Environment = var.environment
  }
}

variable "subnet_cidrs" {
    default = [
    "10.10.10.0/24",
    "10.10.20.0/24"
    ]
}















# resource "aws_subnet" "my_subnet_2" {
#   vpc_id            = var.vpc_id 
#   cidr_block        = var.subnet_2_cidr
#   availability_zone = var.availability_zone_2

#     tags = {
#     Environment = var.environment
#   }
# }