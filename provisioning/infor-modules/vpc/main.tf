  
# VPC creation
resource "aws_vpc" "terraform" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

# http subnet configuration
resource "aws_subnet" "http1" {
  vpc_id     = aws_vpc.terraform.id
  cidr_block = var.network_http1["cidr"]
  tags = {
    Name = var.subnet_name
  }
  depends_on = [aws_internet_gateway.gw]
}

# External gateway configuration
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.terraform.id
  tags = {
    Name = var.internet-gateway_name
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






