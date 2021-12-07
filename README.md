# AWS VPC Endpoints Terraform sub-module

Terraform sub-module which creates VPC endpoint resources on AWS.

## Usage

See [`examples`](../../examples) directory for working examples to reference:

```hcl
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
```

## Examples

- [Complete-VPC](../../examples/complete-vpc) with VPC Endpoints.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.28 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.28 |

## Modules

VPC Endpoint Module

## Resources

| Name | Type |
|------|------|
| [aws_vpc_endpoint.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint_service.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc_endpoint_service) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create"></a> [create](#input\_create) | Determines whether resources will be created | `bool` | `true` | no |
| <a name="input_endpoints"></a> [endpoints](#input\_endpoints) | A map of interface and/or gateway endpoints containing their properties and configurations | `any` | `{}` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | Default security group IDs to associate with the VPC endpoints | `list(string)` | `[]` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Default subnets IDs to associate with the VPC endpoints | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to use on all resources | `map(string)` | `{}` | no |
| <a name="input_timeouts"></a> [timeouts](#input\_timeouts) | Define maximum timeout for creating, updating, and deleting VPC endpoint resources | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC in which the endpoint will be used | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoints"></a> [endpoints](#output\_endpoints) | Array containing the full resource object and attributes for all endpoints created |
​