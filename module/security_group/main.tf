resource "aws_security_group" "example_security_group" {
    name        = "${var.project_name}-security-group"
    description = "Allow inbound traffic"

    tags = {
        Name = "${var.project_name}-security-group"
    }   
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
    security_group_id = aws_security_group.example_security_group.id
    to_port           = 22
    from_port         = 22
    ip_protocol       = "tcp"
    cidr_ipv4         = var.allow_ssh_ip
}


resource "aws_vpc_security_group_ingress_rule" "allow_ipv4" {
    for_each = {
        for key, value in var.ingress_allow_ip : key => value
        if value.port != null && value.port != null
    }
    security_group_id = aws_security_group.example_security_group.id
    to_port           = each.value.port
    from_port         = each.value.port
    ip_protocol       = "tcp"
    cidr_ipv4         = each.value.ip

    tags = {
        Name = each.key
    }
}

# 모든 트래픽을 허용하는 규칙
# resource "aws_vpc_security_group_ingress_rule" "allow_all_myself_ipv4" {
#     security_group_id = aws_security_group.example_security_group.id
#     to_port = 0
#     from_port = 0
#     ip_protocol = "-1"
#     cidr_ipv4 = var.myself_ip
# }



resource "aws_vpc_security_group_egress_rule" "allow_tls_ipv4" {
    for_each = {
        for key, value in var.egress_allow_ip : key => value
        if value.port != null && value.port != null
    }
    security_group_id = aws_security_group.example_security_group.id
    to_port           = each.value.port
    from_port         = each.value.port
    ip_protocol       = "tcp"
    cidr_ipv4         = each.value.ip

    tags = {
        Name = each.key
    }
}

# 모든 트래픽을 허용하는 규칙
# resource "aws_vpc_security_group_egress_rule" "allow_all_tls_ipv4" {
#     security_group_id = aws_security_group.example_security_group.id
#     to_port = 0
#     from_port = 0
#     ip_protocol = "-1"
#     cidr_ipv4 = "0.0.0.0/0"
# }

