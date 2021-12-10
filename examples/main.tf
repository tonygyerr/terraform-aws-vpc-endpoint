module "endpoints" {
  source = "git::https://github.com/tonygyerr/terraform-aws-vpc-endpoint.git"

  create             = var.create
  vpc_config         = var.vpc_config

  endpoints = {
    dynamodb = {
      service = "dynamodb"
      private_dns_enabled = false
      service_type    = "Gateway"
      route_table_ids = [data.aws_route_tables.private.id]
      tags            = { Name = "${var.app_name}-dynamodb-vpc-endpoint" }
    },
    ec2 = {
      service             = "ec2"
      private_dns_enabled = true
      security_group_ids  = [aws_security_group.vpce.id]
      subnet_ids          = var.subnet_ids
      tags                = { Name = "${var.app_name}-ec2-vpc-endpoint" }
    },
    ec2messages = {
      service             = "ec2messages"
      private_dns_enabled = true
      security_group_ids  = [aws_security_group.vpce.id]
      subnet_ids          = var.subnet_ids
      tags                = { Name = "${var.app_name}-ec2messages-vpc-endpoint" }
    },
    lambda = {
      service             = "lambda"
      private_dns_enabled = true
      security_group_ids  = [aws_security_group.vpce.id]
      subnet_ids          = var.subnet_ids
      tags                = { Name = "${var.app_name}-lambda-vpc-endpoint" }
    },
    logs = {
      service             = "logs"
      private_dns_enabled = true
      security_group_ids  = [aws_security_group.vpce.id]
      subnet_ids          = var.subnet_ids
      tags                = { Name = "${var.app_name}-logs-vpc-endpoint" }
    },
    monitoring = {
      service             = "monitoring"
      private_dns_enabled = true
      security_group_ids  = [aws_security_group.vpce.id]
      subnet_ids          = var.subnet_ids
      tags                = { Name = "${var.app_name}-monitoring-vpc-endpoint" }
    },
    rds = {
      service             = "rds"
      private_dns_enabled = true
      security_group_ids  = [aws_security_group.vpce.id]
      subnet_ids          = var.subnet_ids
      tags                = { Name = "${var.app_name}-rds-vpc-endpoint" }
    },
    s3 = {
      service         = "s3"
      private_dns_enabled = false
      service_type    = "Gateway"
      route_table_ids = [data.aws_route_tables.private.id]
      policy          = templatefile("${path.module}/${var.bucket_policy}", {
        aws_region           = jsonencode(var.aws_region),
        account_id           = jsonencode(data.aws_caller_identity.current.account_id),
        aws_role             = jsonencode(var.aws_role),
      }) 
      tags            = { Name = "${var.app_name}-s3-vpc-endpoint" }
    },
    secretsmanager = {
      service             = "secretsmanager"
      private_dns_enabled = true
      security_group_ids  = [aws_security_group.vpce.id]
      subnet_ids          = var.subnet_ids
      tags                = { Name = "${var.app_name}-secretsmanager-vpc-endpoint" }
    },
    sqs = {
      service             = "sqs"
      private_dns_enabled = true
      security_group_ids  = [aws_security_group.vpce.id]
      subnet_ids          = var.subnet_ids
      tags                = { Name = "${var.app_name}-sqs-vpc-endpoint" }
    },
    ssm = {
      service             = "ssm"
      private_dns_enabled = true
      security_group_ids  = [aws_security_group.vpce.id]
      subnet_ids          = var.subnet_ids
      tags                = { Name = "${var.app_name}-ssm-vpc-endpoint" }
    },
    ssmmessages = {
      service             = "ssmmessages"
      private_dns_enabled = true
      security_group_ids  = [aws_security_group.vpce.id]
      subnet_ids          = var.subnet_ids
      tags                = { Name = "${var.app_name}-ssmmessages-vpc-endpoint" }
    },
  }

  tags = var.tags
}