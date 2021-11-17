output "s3_role_name" {
  value     = aws_iam_role.ec2_s3_role.arn
  sensitive = true
}

# output "ec2_public_ip" {
#   value = aws_instance.web.private_ip
# }

output "vpc_instance_tenancy" {
  value = aws_vpc.my_vpc.instance_tenancy
}

output "key_pair" {
  value = aws_key_pair.ec2_key_pair.fingerprint
}

output "public_key" {
  value = tls_private_key.example.private_key_pem
}