terraform {
   source = "../vpc"
}

inputs = {
  vpc_name = "vpc-terrafrom"
  vpc_cidr = "10.10.0.0/16"
  subnet_name = "subnetr-_http2"
  internet-gateway_name = "interget-gateway"
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  public_subnets  = ["10.10.101.0/24", "10.10.102.0/24", "10.10.103.0/24"]

  enable_nat_gateway = true
  single_nat_gateway = true

  enable_dns_hostnames = true
  enable_dns_support   = true
}

