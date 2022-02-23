# Copyright The Cloud Custodian Authors.
# SPDX-License-Identifier: Apache-2.0

provider "aws" {
  region = "us-east-2"
}

resource "aws_sqs_queue" "test_sqs" {
  name = uuid()
  tags = {
    yor_trace = "493f368b-f39d-438c-b73e-dedb6a7bbc62"
  }
}
