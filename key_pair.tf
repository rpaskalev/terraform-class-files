resource "aws_key_pair" "ec2_key_pair" {
  key_name   = "ziyote-class-key"
  public_key = tls_private_key.example.public_key_openssh
}

resource "tls_private_key" "example" {
  algorithm   = "RSA"
  ecdsa_curve = "P384"
}