#this resource will create a separate ec2 instance in th edefault VPC. It will error is a default VPC doesnt exist. 

resource "aws_instance" "web" {
  ami               = "your-ami-id"
  availability_zone = "your-availability-zone"


  key_name      = "your_pem_key"
  instance_type = "t2.micro"


  vpc_security_group_ids = ["your-security_group"]

  network_interface {
    network_interface_id = aws_network_interface.ziyotek_1.id
    device_index         = 0
  }

  tags = {
    Name = "your-name"
  }
}

