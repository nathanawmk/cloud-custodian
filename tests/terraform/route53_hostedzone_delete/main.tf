resource "aws_route53_zone" "test_hosted_zone" {
  name = "custodian.net"

  tags = {
    "TestTag" = "yes"
    yor_trace = "b39b2162-2b17-4221-881d-ef8991efb57b"
  }
}

resource "aws_route53_record" "test_r53_record" {
  zone_id = aws_route53_zone.test_hosted_zone.zone_id
  name    = "test.custodian.net"
  type    = "A"
  ttl     = "300"
  records = ["1.1.1.1"]
}
