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
  count         = 5
  ami           = var.aws_amis[var.aws_region]
  instance_type = var.instance_type1
  associate_public_ip_address = true  
  private_ip = cidrhost(
    "10.10.10.0/24",
    11 + count.index,
  )

  key_name      = var.key_name
  subnet_id = var.subnet_id
  vpc_security_group_ids = [
    var.sg_administration_id,
    var.sg_web_id,
  ]
  tags = {
    Name = "http-server-${count.index + 1}"
    Environment = var.environment
  }
}






