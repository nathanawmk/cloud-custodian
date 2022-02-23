resource "aws_eks_node_group" "deleted_example" {
  cluster_name    = aws_eks_cluster.example.name
  node_role_arn   = aws_iam_role.node_group_example.arn
  node_group_name = "deleted-example"
  subnet_ids      = aws_subnet.node_group_example[*].id

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  tags = {
    "Name"        = "deleted-example"
    "ClusterName" = aws_eks_cluster.example.name
    yor_trace     = "a97d68da-bc93-49af-8c0e-6d3f7cdc171d"
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
  ]
}

resource "aws_eks_node_group" "not_deleted_example" {
  cluster_name    = aws_eks_cluster.example.name
  node_role_arn   = aws_iam_role.node_group_example.arn
  node_group_name = "not_deleted_example"
  subnet_ids      = aws_subnet.node_group_example[*].id

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  tags = {
    "Name"        = "not-deleted-example"
    "ClusterName" = aws_eks_cluster.example.name
    yor_trace     = "01ca4142-7fc8-4f9d-82b0-f87ec997629f"
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
  ]
}

resource "aws_iam_role" "node_group_example" {
  name = "eks-node-group-example"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
  tags = {
    yor_trace = "95e8d1a5-f149-4b67-990a-08c14dcd2545"
  }
}

resource "aws_iam_role_policy_attachment" "example-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.node_group_example.name
}

resource "aws_iam_role_policy_attachment" "example-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.node_group_example.name
}

resource "aws_iam_role_policy_attachment" "example-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.node_group_example.name
}
