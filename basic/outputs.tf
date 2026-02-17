output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = [for subnet in aws_subnet.public : subnet.id]
}

output "private_subnet_ids" {
  value = [for subnet in aws_subnet.private : subnet.id]
}

output "web_instance_ids" {
  value = [for instance in aws_instance.web : instance.id]
}

output "alb_dns_name" {
  value = aws_lb.app.dns_name
}

output "route53_zone_id" {
  value = aws_route53_zone.main.zone_id
}

output "app_fqdn" {
  value = "${aws_route53_record.app.name}.${var.domain_name}"
}

output "s3_bucket_name" {
  value = aws_s3_bucket.app.bucket
}

output "rds_endpoint" {
  value = aws_db_instance.main.endpoint
}
