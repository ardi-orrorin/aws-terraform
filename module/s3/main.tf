data "aws_iam_policy_document" "default" {
    version = "2012-10-17"

    statement {
        sid    = "Statement1"
        effect = "Allow"
        
        actions = [ 
            "s3:*",
        ]

        principals {
            type        = "*"
            identifiers = [
                "*"
            ]
        }

        resources = [
            aws_s3_bucket.default.arn,
            "${aws_s3_bucket.default.arn}/*",
        ]
    }
}

resource "aws_s3_bucket" "default" {
  bucket = "${var.project_name}-bucket-123"
  


  tags = {
    Name        = "${var.project_name}-bucket"
    Environment = "Default"
  }
}


resource "aws_s3_bucket_public_access_block" "default" {
  bucket = aws_s3_bucket.default.id

  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "default" {
    depends_on = [ resource.aws_s3_bucket_public_access_block.default ]
    bucket     = aws_s3_bucket.default.id
    policy     = data.aws_iam_policy_document.default.json
}

resource "aws_s3_bucket_cors_configuration" "default" {
  bucket = aws_s3_bucket.default.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT", "POST"]
    allowed_origins = ["*"]
    # expose_headers  = ["ETag"]
    # max_age_seconds = 3000
  }
}