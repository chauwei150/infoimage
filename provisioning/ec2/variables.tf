# parms file for aws ec2 cloud
variable "aws_region" {
  description = "AWS region to launch servers."
  type        = string
}

variable "aws_amis" {
  type = map
  default = {
    "eu-west-1" = "ami-b1cf19c6"
    "us-east-1" = "ami-de7ab6b6"
    "us-west-1" = "ami-005c06c6de69aee84"
    "us-west-2" = "ami-05f991c49d264708f"
  }
}


# parms file for aws ec2 cloud

variable "server_amount" {
  type = number
}

variable "start_ip" {
  type    = number
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "sg_administration_id" {
  type = string
}

variable "sg_web_id" {
  type = string
}

#### HTTP PARAMS
variable "network_http1" {
  type = map(string)
  default = {
    subnet_name = "subnet_http1"
    cidr        = "10.10.10.0/24"
  }
}


variable "network_http2" {
  type = map(string)
  default = {
    subnet_name = "subnet_http2"
    cidr        = "10.10.20.0/24"
  }
}
variable "network_http3" {
  type = map(string)
  default = {
    subnet_name = "subnet_http3"
    cidr        = "10.10.30.0/24"
  }
}

# Set number of instance
variable "http1_instance_names" {
  type    = set(string)
  default = ["instance-http1-1"]
}

# Set number of instance
variable "http2_instance_names" {
  type    = set(string)
  default = ["instance-http2-1"]
}

# Set number of instance
variable "http3_instance_names" {
  type    = set(string)
  default = ["instance-http3-1"]
}

# Set number of instance
variable "http4_instance_names" {
  type    = set(string)
  default = ["instance-http4-1"]
}
variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
  default     = "Infoimage"
}

variable "environment" {
   type = string
   default  = "development"
   description = "The deployment environment (development, staging, production)"
}

variable "instance_type1" {
      type        = string
      description = "The EC2 instance type to provision."
      default     = "t3.micro" # Optional default value
}

variable "instance_type2" {
      type        = string
      description = "The EC2 instance type to provision."
      default     = "t3.medium" # Optional default value
}

variable "instance_type3" {
      type        = string
      description = "The EC2 instance type to provision."
      default     = "t3.large" # Optional default value
    }


