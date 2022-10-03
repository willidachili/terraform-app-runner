# 1. Bytt ut bucket med  variabel
# 2. Gi variabel default
# 3- Fjern default
# 4- Gi parameter på kommandlinje

resource "aws_s3_bucket" "b" {
  bucket = "pgr301-testbucket-glennbech"

  tags = {
    Name        = "pgr301-testbucket-glennbech"
    Environment = "Dev"
  }
}

