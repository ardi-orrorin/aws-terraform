# resource "aws_key_pair" "ec2_key_pair" {
#     key_name   = var.aws_ec2_key_pair
#     public_key = file(var.public_key)
# }

data "aws_key_pair" "key_pair" {
    # key_name = aws_key_pair.ec2_key_pair.key_name
    key_name = var.aws_ec2_key_pair_key_name
}