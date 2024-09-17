output "key_pair_name" {
    value = data.aws_key_pair.key_pair.key_name
    description = "Key Pair Name"
}

output "key_pair_public_key" {
    value = var.public_key
    description = "Public Key"
}