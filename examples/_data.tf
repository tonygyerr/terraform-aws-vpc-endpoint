data "aws_caller_identity" "current" {}

data "aws_route_tables" "public" {
  vpc_id = var.vpc_config.vpc_id

  filter {
    name   = "tag:Name"
    values = ["app-vpce-dev-public-rt"]
  } 
}

data "aws_route_tables" "private" {
  vpc_id = var.vpc_config.vpc_id

  filter {
    name   = "tag:Name"
    values = ["app-vpce-dev-private-rt"]
  }
} 