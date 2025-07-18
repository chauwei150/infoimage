  
# VPC creation
resource "aws_vpc" "terraform" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "vpc-terraform"
  }
}

# http subnet configuration
resource "aws_subnet" "http1" {
  vpc_id     = aws_vpc.terraform.id
  cidr_block = var.network_http1["cidr"]
  tags = {
    Name = "subnet-http1"
  }
  depends_on = [aws_internet_gateway.gw]
}
# External gateway configuration
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.terraform.id
  tags = {
    Name = "internet-gateway"
  }
}


# Create associate route
  
# Routing table configuration
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.terraform.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}
# Associate http1 route
resource "aws_route_table_association" "http1" {
  subnet_id      = aws_subnet.http1.id
  route_table_id = aws_route_table.public.id
}


#### INSTANCE Admin ####
  
# Create instance
resource "aws_instance" "http1" {
  for_each      = var.http1_instance_names
  private_ip    = "10.10.10.9"
  ami           = var.aws_amis[var.aws_region]
  instance_type = var.instance_type1
  key_name      = var.key_name
  vpc_security_group_ids = [
    aws_security_group.administration.id,
    aws_security_group.web.id,
  ]
  subnet_id = aws_subnet.http1.id
  tags = {
    Name = each.key
    Environment = var.environment
  }
}


# Attach floating ip on instance http
resource "aws_eip" "public_http1" {
  for_each   = var.http1_instance_names
  domain = "vpc"
  instance   = aws_instance.http1[each.key].id
  depends_on = [aws_internet_gateway.gw]
  tags = {
    Name = "public-http1-${each.key}"
  }
}
# Create instance
resource "aws_instance" "http4" {
  for_each      = var.http4_instance_names
  private_ip    = "10.10.10.10"
  ami           = var.aws_amis[var.aws_region]
  instance_type = var.instance_type1
  key_name      = var.key_name
  vpc_security_group_ids = [
    aws_security_group.administration.id,
    aws_security_group.web.id,
  ]
  subnet_id = aws_subnet.http1.id
  tags = {
    Name = each.key
    Environment = var.environment
  }
}


# Attach floating ip on instance http
resource "aws_eip" "public_http4" {
  for_each   = var.http4_instance_names
  domain = "vpc"
  instance   = aws_instance.http4[each.key].id
  depends_on = [aws_internet_gateway.gw]
  tags = {
    Name = "public-http4-${each.key}"
  }
}




