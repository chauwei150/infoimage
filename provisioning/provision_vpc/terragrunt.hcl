terraform {
   source = "../ec2"
}

inputs = {
  vpc_name = "vpc-terraform"
  vpc_cidr = "10.10.0.0/16"
  subnet_name = "subnet_http1"
  internet-gateway_name = "interget-gateway"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

