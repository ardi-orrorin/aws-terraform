variable "instance_type" {
    default = "t2.micro"
    description = "인스턴스 타입"
}

variable "aws_ec2_key_pair" {
    type = string
    description = "AWS EC2 Key Pair"
    default = "ec2_key_pair"
}

variable "public_key" {
    type = string
    description = "Public Key"
    default = "~/.ssh/id_rsa.pub"
}