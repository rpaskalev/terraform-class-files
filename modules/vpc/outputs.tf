output "vpc_id" {
    value = aws_vpc.my_vpc.id
}

output "subnet_1_id" {
    value = aws_subnet.my_subnet_1.id
}

output "subnet_2_id" {
    value = aws_subnet.my_subnet_2.id
}