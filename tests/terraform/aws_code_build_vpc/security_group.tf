resource "aws_security_group" "example1" {
  name        = "example1"
  description = "In use"
  vpc_id      = aws_vpc.example.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.example.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    yor_trace = "dce69149-f771-469e-8580-79ef0f836d45"
  }
}

resource "aws_security_group" "example2" {
  name        = "example2"
  description = "Unused"
  vpc_id      = aws_vpc.example.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.example.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    yor_trace = "abf08f66-8822-4181-851e-136b13c83de6"
  }
}

