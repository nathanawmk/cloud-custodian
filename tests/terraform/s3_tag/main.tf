resource "aws_s3_bucket" "example" {
  bucket = "my-custodian-test-bucket"
  acl    = "private"

  tags = {
    original-tag = "original-value"
    original-tag = "original-value"
    yor_trace    = "7f296850-4d09-4820-a357-586449df166f"
  }
}