resource "aws_instance" "web" {
  ami = var.environment == "sbx" ? "ami-04d29b6f966df1537" : data.aws_ami.example.image_id

  subnet_id                   = var.subnet_id
  associate_public_ip_address = true            

  user_data = var.user_data 

  iam_instance_profile = var.instance_profile
  ebs_optimized        = var.ebs_optimized

  key_name      = var.key_name
  instance_type = var.instace_type

  # Security group must be declared in the network_interface_id block if we are adding that parameter.
  vpc_security_group_ids = var.vpc_security_group
    
  tags = {
    Name = "SampleApp"    
  }
}