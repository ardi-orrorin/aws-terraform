output "id" {
    value = aws_security_group.default.id
}

output "ssh_ingress_rule" {
    value = aws_vpc_security_group_ingress_rule.allow_ssh_ipv4
    sensitive = true
}

output "ingress_rules" {
    value = aws_vpc_security_group_ingress_rule.allow_ipv4
    sensitive = true
}

output "egress_rules" {
    value = aws_vpc_security_group_egress_rule.allow_tls_ipv4
    sensitive = true
}

output "aws_default_vpc_id" {
  value = aws_security_group.default.vpc_id
}