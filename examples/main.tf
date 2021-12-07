module "endpoints" {
  source = "git::https://github.com/tonygyerr/terraform-aws-vpc-endpoint.git"

  create             = var.create
  
  vpc_id             = "vpc-01234567890123"
  security_group_ids = ["${aws_security_group.vpce.id}"]
  endpoints = {
    s3 = {
      service         = "s3"
      service_type    = "Gateway"
      route_table_ids = ["rtb-01234567890123"]
      policy          = "${data.aws_iam_policy_document.example.json}"
      tags            = { Name = "${var.app_name}-s3-vpc-endpoint" }
    },
    dynamodb = {
      service = "dynamodb"
      service_type    = "Gateway"
      route_table_ids = ["rtb-01234567890123"]
      tags            = { Name = "${var.app_name}-dynamodb-vpc-endpoint" }
    },
    sns = {
      service         = "sns"
      subnet_ids      = var.subnet_ids
      tags            = { Name = "${var.app_name}-s3-sns-endpoint" }
    },
    sqs = {
      service             = "sqs"
      private_dns_enabled = true
      security_group_ids  = ["${aws_security_group.vpce.id}"]
      subnet_ids          = var.subnet_ids
      tags                = { Name = "${var.app_name}-sqs-vpc-endpoint" }
    },
  }
  tags = var.tags
}