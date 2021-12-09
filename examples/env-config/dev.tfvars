#--------------------------------------------------------------
# vpc endpoint
#--------------------------------------------------------------
app_name    = "app-vpce"
create   = true
vpc_config = {
  region            = "us-east-1"
  cidr              = "10.0.0.0/24"
  open_cidr         = "0.0.0.0/0"
  number_of_subnets = "3"
  instance_tenancy  = "default"
  vpc_id            = "vpc-12345678901234567"
}

aws_region          = "us-east-1"
aws_role            = "SSM-EC2-Instance-Role"
bucket_policy       = "policy/s3-policy/s3_policy.json" #tmpl version gives an error invalid character '8' after object key:value pair. reported as a bug
private_route_table_ids = ["rtb-12345678901234567"]
public_route_table_ids  = ["rtb-89012345678901234"]
subnet_ids = ["subnet-01****************", "subnet-02****************", "subnet-03****************"] # if ec2 instance is running on a private subnet(s) use the same subnets within zones i.e. us-east-1a, us-east-1b, us-east-1c

tags = {
  Owner   = "app-vpce"
  env     = "dev"
  Region  = "us-east-1"
  project = "app-vpce"
}