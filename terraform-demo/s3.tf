resource "aws_s3_bucket" "b" {
  bucket = "pgr301-testbucket-glennbech"

  tags = {
    Name        = "pgr301-testbucket-glennbech"
    Environment = "Dev"
  }
}
