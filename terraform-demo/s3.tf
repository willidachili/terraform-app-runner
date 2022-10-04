# 1. Bytt ut bucket med  variabel
# 2. Gi variabel default
# 3- Fjern default
# 4- Gi parameter på kommandlinje

resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.mybucket.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

variable "bucket_name" {
  type = string
}
