resource "aws_vpc" "example" {
  cidr_block = "10.1.0.0/16"
  tags = {
    yor_trace = "4cc52323-6fe7-421b-80f5-295636975094"
  }
}

resource "aws_vpc" "example_no_flow_log" {
  cidr_block = "10.2.0.0/16"
  tags = {
    yor_trace = "a3315c4a-6cf2-4c7d-b596-5ddb9493c3cd"
  }
}

resource "aws_flow_log" "example" {
  iam_role_arn    = aws_iam_role.example.arn
  log_destination = aws_cloudwatch_log_group.example.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.example.id
  tags = {
    yor_trace = "f1bcd3be-d24e-4d24-b5a4-a44269b0a818"
  }
}

resource "aws_cloudwatch_log_group" "example" {
  name = "example"
  tags = {
    yor_trace = "ed1ae457-bb36-47a1-b75a-7fc176a78eac"
  }
}

resource "aws_iam_role" "example" {
  name = "example"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
  tags = {
    yor_trace = "b6909fab-6fbf-4da3-9af3-d7d4db5e6b1c"
  }
}