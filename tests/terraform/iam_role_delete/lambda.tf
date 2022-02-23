resource "aws_lambda_function" "test_lambda" {
  filename      = "payload.zip"
  function_name = "test_function_role"
  role          = aws_iam_role.test_role.arn
  handler       = "main.handler"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = filebase64sha256("payload.zip")

  runtime = "python3.8"

  environment {
    variables = {
      foo = "bar"
    }
  }
  tags = {
    yor_trace = "60a4b65b-418e-4ed6-b8e8-537c1c0b399f"
  }
}
