locals {
  aws_region = "us-west-2"
  vpc_id = "vpc-0ba5b20d35b9aa1ff"
  subnet_id = "subnet-0d5433fdc9727a8f9"
  sg_web_id = "sg-0c97ce707e4c19650"
  sg_administration_id = "sg-0b69491277de6b6e7"
  key_name = "infoimage"
terraform {
   source = "../ec2"
}

inputs = {
  instance_type1 = "t3.medium"
  environment = "development"
}

