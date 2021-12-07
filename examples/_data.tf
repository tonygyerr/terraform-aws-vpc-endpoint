data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "example" {
  statement {
    sid       = "Example"
    actions   = ["*"]
    resources = ["*"]

    principals {
      type        = "AWS"
      identifiers = [data.aws_caller_identity.current.account_id]
    }
  }
}