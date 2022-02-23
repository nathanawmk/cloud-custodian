resource "aws_iam_group" "sandbox_devs" {
  name = "sandbox_developers"
  path = "/users/"
}

resource "aws_iam_user" "sandbox_jill" {
  name = "sandbox_jill"
  tags = {
    yor_trace = "d9e878d6-7e97-4ddd-874e-4b540dc26492"
  }
}

resource "aws_iam_group_membership" sandbox_dev_members {
  name  = "sandbox_dev_members"
  users = [aws_iam_user.sandbox_jill.name]
  group = aws_iam_group.sandbox_devs.name
}
