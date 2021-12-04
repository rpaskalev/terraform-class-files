# locals {
#   atlantis_name = "${local.name_prefix}-atlantis"
#   name_prefix = "environemnt"
# }

# resource "aws_security_group" "atlantis" {
#   name        = local.atlantis_name
#   description = "for the atlantis fargate service"

#   ingress {
#     from_port = 80
#     to_port   = 80
#     protocol  = "tcp"
#     # security_groups = flatten([
#     #   aws_security_group.atlantis-1.id,
#     #   var.sec_gr,
#     #   var.sec_gr1
#     # ])
#     security_groups = [
#       aws_security_group.atlantis-1.id,
#       var.sec_gr,
#       var.sec_gr1
#     ]
#   }

#   egress {
#     from_port = 0
#     to_port   = 0
#     protocol  = "-1"
#     cidr_blocks = [
#       "0.0.0.0/0",
#     ]
#   }
# }
# #########
# resource "aws_security_group" "atlantis-1" {
#   name        = "${local.atlantis_name}-1"
#   description = "for the atlantis fargate service"

#   ingress {
#     from_port = 80
#     to_port   = 80
#     protocol  = "tcp"
#     cidr_blocks = [ "0.0.0.0/0" ]
#   }

#   egress {
#     from_port = 0
#     to_port   = 0
#     protocol  = "-1"
#     cidr_blocks = [
#       "0.0.0.0/0",
#     ]
#   }
# }
# ###########
# variable "sec_gr" {
#     default = []
# }

# variable "sec_gr1" {
#   default = ["sg-e45c45f9"]
# }