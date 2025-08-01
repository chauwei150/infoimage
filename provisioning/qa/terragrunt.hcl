locals {
  aws_region = "us-west-2"
  key_name1 = "Infoimage"
  #common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))
  #cluster_name = local.common_vars.locals.cluster_name
}

terraform {
   source = "../infor-modules/vpc"
}

inputs = {
  aws_region = local.aws_region
  key_name = local.key_name1
  vpc_name = "vpc-web1"
  vpc_cidr = "10.2.0.0/16"
  subnet_name = "subnet_http2"
  subnet_http1_cidr = "10.2.10.0/24"
  internet-gateway_name = "interget-gateway2"
  enable_dns_hostnames = true
  enable_dns_support   = true
  server_amount = 4
  start_ip = 9 
  instance_type1 = "t3.medium"
  environment = "development"
}

