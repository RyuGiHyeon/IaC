resource "aws_lb" "wordpress" {
  load_balancer_type = "application"
  name               = "lb-wordpress"
  internal           = false
  ip_address_type    = "ipv4"
  subnets            = var.public_subnet_ids
  security_groups    = [var.sg_map["lb"]]
}

resource "aws_lb_listener" "wordpress" {
  load_balancer_arn = aws_lb.wordpress.arn

  protocol = "HTTP"
  port     = 80
  default_action {
    type             = "forward"
    target_group_arn = var.target_group_arn
  }
}
