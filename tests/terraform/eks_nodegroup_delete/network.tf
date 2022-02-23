resource "aws_default_route_table" "example" {
  default_route_table_id = aws_vpc.example.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example.id
  }
  tags = {
    yor_trace = "e513ce26-a659-45e8-8289-a90ac079c1b8"
  }
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
  tags = {
    yor_trace = "b3052aee-5edf-4a7a-acd2-d85de9f069cb"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "cluster_example" {
  count = 2

  availability_zone       = data.aws_availability_zones.available.names[count.index]
  cidr_block              = cidrsubnet(aws_vpc.example.cidr_block, 8, count.index)
  vpc_id                  = aws_vpc.example.id
  map_public_ip_on_launch = true
  tags = {
    yor_trace = "072983a4-cd54-4584-ab49-14b347e2eaf1"
  }
}

resource "aws_subnet" "node_group_example" {
  count = 2

  availability_zone       = data.aws_availability_zones.available.names[count.index]
  cidr_block              = cidrsubnet(aws_vpc.example.cidr_block, 8, count.index + 2)
  vpc_id                  = aws_vpc.example.id
  map_public_ip_on_launch = true

  tags = {
    "kubernetes.io/cluster/${aws_eks_cluster.example.name}" = "shared"
    yor_trace                                               = "2fb9e2a7-9720-419f-8f41-3de26a499cff"
  }
}

resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.example.id
  tags = {
    yor_trace = "062529ce-c56b-40cf-82a3-28173e4b0225"
  }
}
