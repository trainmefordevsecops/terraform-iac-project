resource "aws_s3_bucket" "cicd_bucket" {
  bucket = "mycicd8may2025"

  tags = {
    Name        = "mycicd8may2025"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "cicd_bucket_block" {
  bucket = aws_s3_bucket.cicd_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}