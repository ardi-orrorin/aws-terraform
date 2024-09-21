
output "public_ip" {
    value = aws_instance.default.public_ip
    description = "퍼블릭 아이피 주소"
}

output "ec2_id" {
  value = aws_instance.default.id
}
