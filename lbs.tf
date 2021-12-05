# resource "aws_launch_configuration" "web-tier-lc" {
#   name                 = "web-tier-lc"
#   image_id             = data.aws_ami.example.image_id
#   instance_type        = var.instance_type
#   iam_instance_profile = aws_iam_instance_profile.s3_profile.id
#   associate_public_ip_address = true

#   security_groups = [aws_security_group.allow_all.id]
#   user_data       = file("userdata.sh")
#   key_name        = var.key_blahblahblah
# }


# resource "aws_autoscaling_attachment" "web-tier-target-attachment" {
#   alb_target_group_arn   = "${aws_lb_target_group.web-tier-tg.arn}"
#   autoscaling_group_name = "${aws_autoscaling_group.web-tier-asg.id}"
# }

# resource "aws_autoscaling_group" "web-tier-asg" {
#   #availability_zones   = local.availability_zones # can be used instead of vpc_zone_identifier
#   name                 = "web-tier-asg"
#   max_size             = 1
#   min_size             = 1
#   desired_capacity     = 1
#   force_delete         = false
#   launch_configuration = aws_launch_configuration.web-tier-lc.name
#   target_group_arns   = [aws_lb_target_group.web-tier-tg.arn]
#   vpc_zone_identifier = [aws_subnet.my_subnet_1.id] 


#   tag {
#     key                 = "Name"
#     value               = "web-tier-asg"
#     propagate_at_launch = "true"
#   }
# }

# resource "aws_lb" "web-tier-lb" {
#   name               = "web-tier-lb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.allow_all.id]
#   subnets            = [aws_subnet.my_subnet_1.id, aws_subnet.my_subnet_2.id]


#   tags = {
#     Environment = "production"
#   }
# }

# resource "aws_lb_listener" "web-lb-listener" {
#   load_balancer_arn = aws_lb.web-tier-lb.arn
#   port              = "80"
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.web-tier-tg.arn
#   }
# }

# resource "aws_lb_listener_rule" "host_based_weighted_routing" {
#   listener_arn = aws_lb_listener.web-lb-listener.arn
#   priority     = 100

#   action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.web-tier-tg.arn
#   }
#   condition {
#     path_pattern {
#       values = ["/static/*"]
#     }
#   }
# }

# resource "aws_lb_target_group" "web-tier-tg" {
#   name     = "web-tier-tg"
#   port     = 80
#   protocol = "HTTP"
#   vpc_id   = aws_vpc.my_vpc.id
#   tags = {
#     name = "web-tier-tg"
#   }

#   health_check {
#     healthy_threshold   = 3
#     unhealthy_threshold = 10
#     timeout             = 5
#     interval            = 10
#     path                = "/"
#     port                = "traffic-port"
#     matcher             = "200-320" #success codes
#   }
# }

