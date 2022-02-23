provider "aws" {
  region = "us-west-2"
}

resource "aws_cloudwatch_log_group" "test_group" {
  name = uuid()

  tags = {
    Environment = "production"
    App         = "Foie"
    yor_trace   = "5d042758-d67e-41f0-a1fc-8e8af1b66240"
  }
}
