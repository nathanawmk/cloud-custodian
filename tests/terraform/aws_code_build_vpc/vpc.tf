resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "4a4760e6-3079-409d-9dc5-b09d31dee60b"
  }
}

resource "aws_subnet" "example" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.1.0/24"
  tags = {
    yor_trace = "27b5e206-1f81-47fc-b7d9-a44992c42219"
  }
}
