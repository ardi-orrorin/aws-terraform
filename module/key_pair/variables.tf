variable "aws_ec2_key_pair_key_name" {
    type = string
    description = "AWS EC2 Key Pair"
    default = "ec2_key_pair"
}

variable "public_key" {
    type = string
    description = "Public Key"
    default = "~/ec2_key_pair.pem"
}