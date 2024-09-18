
output "public_ip" {
    value = aws_instance.default.public_ip
    description = "퍼블릭 아이피 주소"
}

output "ssh_command" {
    value = "ssh -i ${var.key_pair_name}.pem ubuntu@${aws_instance.instance_test.public_ip}"
    description = "SSH 접속 명령어"
}
