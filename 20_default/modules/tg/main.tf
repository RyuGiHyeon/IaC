resource "aws_lb_target_group" "web" {
  target_type      = var.tg_web.target_type
  name             = var.tg_web.name
  protocol         = var.tg_web.protocol
  port             = var.tg_web.port
  ip_address_type  = var.tg_web.ip_address_type
  vpc_id           = var.vpc_id
  protocol_version = var.tg_web.protocol_version
  health_check {
    protocol            = var.tg_web.health_check.protocol
    path                = var.tg_web.health_check.path
    port                = var.tg_web.health_check.port
    healthy_threshold   = var.tg_web.health_check.healthy_threshold
    unhealthy_threshold = var.tg_web.health_check.unhealthy_threshold
    timeout             = var.tg_web.health_check.timeout
    interval            = var.tg_web.health_check.interval
    matcher             = var.tg_web.health_check.matcher
  }
}

resource "aws_lb_target_group_attachment" "target" {
  count = length(var.instance_ids)

  target_group_arn = aws_lb_target_group.web.arn
  target_id        = var.instance_ids[count.index]
  port             = 80
}
