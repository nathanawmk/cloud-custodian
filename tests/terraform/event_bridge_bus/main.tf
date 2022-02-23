resource "aws_cloudwatch_event_bus" "messenger" {
  name = "chat-messages"
  tags = {
    Env       = "Sandbox"
    yor_trace = "f1833fe7-2083-4b80-8860-795500b14574"
  }
}

resource "aws_cloudwatch_event_permission" "DevAccountAccess" {
  principal      = "123456789012"
  statement_id   = "DevAccountAccess"
  event_bus_name = aws_cloudwatch_event_bus.messenger.name
}
