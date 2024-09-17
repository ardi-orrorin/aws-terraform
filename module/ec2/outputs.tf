
output "public_ip" {
    value = aws_instance.instance_test.public_ip
    description = "퍼블릭 아이피 주소"
}

output "ssh_command" {
    value = "ssh -i ${var.public_key} ubuntu@${aws_instance.instance_test.public_ip}"
    description = "SSH 접속 명령어"
}
