output "s3_role_name" {
    value = aws_iam_role.ec2_s3_role.arn
}

output "ec2_public_ip" {
    value = aws_instance.web.private_ip
}