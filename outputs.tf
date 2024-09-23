output "security_group" {
  value = module.security_group.id
}

output "ebs" {
  value = module.ebs
}

output "ec2" {
  value = module.ec2
}

output "eip" {
  value = module.eip
}

output "rds" {
  value = module.rds
}

output "s3" {
  value = module.s3
}

output "elastic_cache" {
  value = module.elastic_cache
}

output "acm" {
  value = module.acm
}

# output "cloudfront" {
#   value = module.cloudfront
# }