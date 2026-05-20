variable "vpc_id" {
  description = "AWS VPC ID"
  type        = string

}

variable "instance_ids" {
  description = "EC2 인스턴스 IDs"
  type        = list(string)
}

variable "tg_web" {
  description = "타겟 그룹"
  type = object({
    target_type      = string
    name             = string
    protocol         = string
    port             = number
    ip_address_type  = string
    protocol_version = string
    health_check = object({
      protocol            = string
      path                = string
      port                = string
      healthy_threshold   = number
      unhealthy_threshold = number
      timeout             = number
      interval            = number
      matcher             = string
    })
  })

}
