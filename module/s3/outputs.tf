output "bucket_domain_name" {
  value = aws_s3_bucket.default.bucket_domain_name
}

output "bucket_acl" {
  value = aws_s3_bucket.default.acl
}

output "id" {
  value = aws_s3_bucket.default.id
}