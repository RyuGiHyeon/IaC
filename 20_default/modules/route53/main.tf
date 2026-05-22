data "aws_route53_zone" "main" {
  name         = var.domainname
  private_zone = false
}

resource "aws_route53_record" "web" {
  zone_id = data.aws_route53_zone.main.id
  name    = "Www.${var.domainname}"
  records = var.lb_dns_names
  type    = "CNAME"
  ttl     = 60
}
