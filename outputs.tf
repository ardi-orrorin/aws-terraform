output "security_group" {
  value = module.security_group.id
}

output "ec2" {
  value = module.ec2
}

output "rds" {
  value = module.rds
}


output "s3" {
  value = module.s3
}


# output "elastic_cache" {
#   value = module.elastic_cache
# }

# # output "cloudfront" {
# #   value = module.cloudfront
# # }