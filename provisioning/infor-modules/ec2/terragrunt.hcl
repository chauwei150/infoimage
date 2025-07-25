locals {
  aws_region = "us-west-2"
  vpc_id = "vpc-0ba5b20d35b9aa1ff"
  subnet_id = "subnet-0d5433fdc9727a8f9"
  sg_web_id = "sg-0c97ce707e4c19650"
  sg_administration_id = "sg-0b69491277de6b6e7"
  key_name1 = "Infoimage"
  #common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))
  #cluster_name = local.common_vars.locals.cluster_name
}

terraform {
   source = "./main.tf"
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

