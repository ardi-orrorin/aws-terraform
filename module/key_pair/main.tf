resource "aws_key_pair" "ec2_key_pair" {
    key_name   = var.key_name
    public_key = var.public_key
    tags = {
        Name = "${var.project_name}-key-pair"
    }
}

# data "aws_key_pair" "key_pair" {
#     # key_name = aws_key_pair.ec2_key_pair.key_name
#     key_name = var.key_name
# }