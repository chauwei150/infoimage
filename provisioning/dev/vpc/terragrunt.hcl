locals {
  aws_region = "us-west-2"
  key_name1 = "Infoimage"
  #common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))
  #cluster_name = local.common_vars.locals.cluster_name
}

terraform {
   source = "../../infra-modules/vpc"
}

inputs = {
  name = "vpc-dev"
  cidr = "10.1.0.0/16"
  azs  = ["us-west-2a", "us-west-2b", "us-west-2c"]
  public_subnets  = ["10.1.10.0/24", "10.1.20.0/24", "10.1.30.0/24"]
  public_subnet_names = ["dev-web1", "dev-web2", "dev-web3"]
  subnet_http1_cidr = "10.1.10.0/24"
  internet-gateway_name = "interget-gateway"
  enable_dns_hostnames = true
  enable_dns_support   = true
  aws_region = local.aws_region
  key_name = local.key_name1
}

