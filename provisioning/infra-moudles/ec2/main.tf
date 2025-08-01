terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}


#### INSTANCE Admin ####
  
# Create instance
resource "aws_instance" "http_servers" {
  count         = var.server_amount
  ami           = var.aws_amis[var.aws_region]
  instance_type = var.instance_type1
  associate_public_ip_address = true  
  private_ip    = cidrhost(
    "10.1.10.0/24", var.start_ip + count.index
  )

  key_name      = var.key_name
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [
    var.sg_administration_id,
    var.sg_web_id,
  ]
  tags = {
    Name = "http-server-${count.index + 1}"
    Environment = var.environment
  }
}
# Security group configuration
  
# Default administration port
resource "aws_security_group" "administration" {
  name        = "administration"
  description = "Allow default administration service"
  vpc_id      = var.vpc_id
  tags = {
    Name = "administration"
  }

  # Open ssh port
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow icmp
  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
   # Open nfs port
  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

# Open nfs port
  ingress {
    from_port   = 111
    to_port     = 111
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Open access to public network
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



# Open web port
resource "aws_security_group" "web" {
  name        = "web"
  description = "Allow web incgress trafic"
  vpc_id      = var.vpc_id
  tags = {
    Name = "web"
  }

  # http port
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # https port
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 # Open access to public network
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}









