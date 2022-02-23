resource "aws_s3_bucket" "example_a" {
  bucket = "c7n-aws-s3-encryption-audit-test-a"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }
  tags = {
    yor_trace = "c7e07469-0e85-466d-920d-54bd28b5cedb"
  }
}

resource "aws_s3_bucket" "example_b" {
  bucket = "c7n-aws-s3-encryption-audit-test-b"
  acl    = "private"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    yor_trace = "4139dd79-57b2-478c-9785-76d6e7d336da"
  }
}

resource "aws_s3_bucket" "example_c" {
  bucket = "c7n-aws-s3-encryption-audit-test-c"
  acl    = "private"
  tags = {
    yor_trace = "1cdb26ed-cb98-4cd9-99a4-10e117ca49ad"
  }
}
