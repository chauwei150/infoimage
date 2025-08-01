locals {
  aws_region = "us-west-2"
  vpc_id = "vpc-0dead5f7a03c2cb99"
  subnet_id = "subnet-075552f09d29061a4"
  key_name1 = "Infoimage"
  #common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))
  #cluster_name = local.common_vars.locals.cluster_name
}

terraform {
   source = "../../infra-modules/ec2"
}

inputs = {
  aws_region = local.aws_region
  vpc_id = local.vpc_id
  subnet_id = local.subnet_id
  key_name = local.key_name1
  server_amount = 4
  start_ip = 9 
  instance_type1 = "t3.medium"
  environment = "development"
}

