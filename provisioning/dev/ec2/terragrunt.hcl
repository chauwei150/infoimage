locals {
  aws_region = "us-west-2"
  vpc_id = "vpc-0dc98175414a688ef"
  subnet_id = "subnet-0ef9f322c280f6a03"
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
  subnet_cidr = "10.1.20.0/24"
  key_name = local.key_name1
  server_amount = 4
  start_ip = 9
  instance_type1 = "t3.medium"
  environment = "development"
}
