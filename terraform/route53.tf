data "aws_route53_zone" "primary" {
  name = "fuse.tikal.io."
}

resource "aws_route53_record" "chaos-jenkins" {
  
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = "chaos-jenkins"
  type    = "A"
  ttl     = "300"
  records = ["${data.aws_eip.eip.public_ip}"]
}