locals {
  aws_region = "us-west-2"
  vpc_id = "vpc-0f48b7fe5ee00e8e2"
  subnet_id = "subnet-06abecf74596e2352"
  sg_web_id = "sg-0c97ce707e4c19650"
  sg_administration_id = "sg-0b69491277de6b6e7"
  key_name1 = "Infoimage"
  #common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))
  #cluster_name = local.common_vars.locals.cluster_name
}

terraform {
   source = "../../infra-modules"
}

inputs = {
  aws_region = local.aws_region
  vpc_id = local.vpc_id
  subnet_id = local.subnet_id
  sg_web_id = local.sg_web_id
  sg_administration_id = local.sg_administration_id
  key_name = local.key_name1
  server_amount = 4
  start_ip = 9
  instance_type1 = "t3.medium"
  environment = "development"
}
