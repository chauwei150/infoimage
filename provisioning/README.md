### 
see ./terraform/variables.tf  and terragrunt.hcl for all variables

In the ./terraform/main.tf

will create a VPC 10.10.0.0/16 similar ro VLAN 10
create two VMs with IP 10.10.10.9 and 10.10.10.10
in ubuntu 24.04

terragrunt init
terragrunt plan
terragrunt apply
or
terragrunt run --all apply

20:46:39.157 INFO   The runner at . will be processed in the following order for command apply:

Group 1
- Unit ./terraform

Are you sure you want to run 'terragrunt apply' in each unit of the run queue displayed above? (y/n) y
20:46:46.345 INFO   [terraform] terraform: Initializing the backend...

20:46:46.356 INFO   [terraform] terraform: Initializing provider plugins...

20:46:46.357 INFO   [terraform] terraform: - Finding latest version of hashicorp/aws...

20:46:46.863 INFO   [terraform] terraform: - Installing hashicorp/aws v6.4.0...

20:46:56.504 INFO   [terraform] terraform: - Installed hashicorp/aws v6.4.0 (signed by HashiCorp)

20:46:56.504 INFO   [terraform] terraform: Terraform has created a lock file .terraform.lock.hcl to record the provider

20:46:56.504 INFO   [terraform] terraform: selections it made above. Include this file in your version control repository

20:46:56.504 INFO   [terraform] terraform: so that Terraform can guarantee to make the same selections by default when

20:46:56.504 INFO   [terraform] terraform: you run "terraform init" in the future.

20:46:56.506 INFO   [terraform] terraform: Terraform has been successfully initialized!

20:46:56.506 INFO   [terraform] terraform: 

20:46:56.506 INFO   [terraform] terraform: You may now begin working with Terraform. Try running "terraform plan" to see

20:46:56.506 INFO   [terraform] terraform: any changes that are required for your infrastructure. All Terraform commands

20:46:56.506 INFO   [terraform] terraform: should now work.

20:46:56.506 INFO   [terraform] terraform: If you ever set or change modules or backend configuration for Terraform,

20:46:56.506 INFO   [terraform] terraform: rerun this command to reinitialize your working directory. If you forget, other

20:46:56.507 INFO   [terraform] terraform: commands will detect it and remind you to do so if necessary.

20:47:02.788 STDOUT [terraform] terraform: Terraform used the selected providers to generate the following execution

20:47:02.788 STDOUT [terraform] terraform: plan. Resource actions are indicated with the following symbols:

20:47:02.788 STDOUT [terraform] terraform:   + create

20:47:02.788 STDOUT [terraform] terraform: Terraform will perform the following actions:

20:47:02.789 STDOUT [terraform] terraform:   # aws_eip.public_http1["instance-http1-1"] will be created

20:47:02.789 STDOUT [terraform] terraform:   + resource "aws_eip" "public_http1" {

20:47:02.789 STDOUT [terraform] terraform:       + allocation_id        = (known after apply)

20:47:02.789 STDOUT [terraform] terraform:       + arn                  = (known after apply)

20:47:02.789 STDOUT [terraform] terraform:       + association_id       = (known after apply)

20:47:02.789 STDOUT [terraform] terraform:       + carrier_ip           = (known after apply)

20:47:02.789 STDOUT [terraform] terraform:       + customer_owned_ip    = (known after apply)

20:47:02.789 STDOUT [terraform] terraform:       + domain               = "vpc"

20:47:02.789 STDOUT [terraform] terraform:       + id                   = (known after apply)

20:47:02.789 STDOUT [terraform] terraform:       + instance             = (known after apply)

20:47:02.789 STDOUT [terraform] terraform:       + ipam_pool_id         = (known after apply)20:47:02.789 STDOUT [terraform] 

20:47:02.789 STDOUT [terraform] terraform:       + network_border_group = (known after apply)

20:47:02.789 STDOUT [terraform] terraform:       + network_interface    = (known after apply)

20:47:02.789 STDOUT [terraform] terraform:       + private_dns          = (known after apply)

20:47:02.789 STDOUT [terraform] terraform:       + private_ip           = (known after apply)

20:47:02.789 STDOUT [terraform] terraform:       + ptr_record           = (known after apply)

20:47:02.789 STDOUT [terraform] terraform:       + public_dns           = (known after apply)

20:47:02.789 STDOUT [terraform] terraform:       + public_ip            = (known after apply)

20:47:02.789 STDOUT [terraform] terraform:       + public_ipv4_pool     = (known after apply)

20:47:02.789 STDOUT [terraform] terraform:       + region               = "us-west-2"

20:47:02.789 STDOUT [terraform] terraform:       + tags                 = {

20:47:02.789 STDOUT [terraform] terraform:           + "Name" = "public-http1-instance-http1-1"

20:47:02.789 STDOUT [terraform] terraform:         }

20:47:02.789 STDOUT [terraform] terraform:       + tags_all             = {

20:47:02.789 STDOUT [terraform] terraform:           + "Name" = "public-http1-instance-http1-1"

20:47:02.789 STDOUT [terraform] terraform:         }

20:47:02.789 STDOUT [terraform] terraform:     }

20:47:02.789 STDOUT [terraform] terraform:   # aws_eip.public_http4["instance-http4-1"] will be created

20:47:02.789 STDOUT [terraform] terraform:   + resource "aws_eip" "public_http4" {

20:47:02.789 STDOUT [terraform] terraform:       + allocation_id        = (known after apply)

20:47:02.790 STDOUT [terraform] terraform:       + arn                  = (known after apply)

20:47:02.790 STDOUT [terraform] terraform:       + association_id       = (known after apply)

20:47:02.790 STDOUT [terraform] terraform:       + carrier_ip           = (known after apply)

20:47:02.790 STDOUT [terraform] terraform:       + customer_owned_ip    = (known after apply)
20:47:02.790 STDOUT [terraform] terraform:       + domain               = "vpc"
20:47:02.790 STDOUT [terraform] terraform:       + id                   = (known after apply)

20:47:02.790 STDOUT [terraform] terraform:       + instance             = (known after apply)

20:47:02.790 STDOUT [terraform] terraform:       + ipam_pool_id         = (known after apply)

20:47:02.790 STDOUT [terraform] terraform:       + network_border_group = (known after apply)

20:47:02.790 STDOUT [terraform] terraform:       + network_interface    = (known after apply)

20:47:02.790 STDOUT [terraform] terraform:       + private_dns          = (known after apply)

20:47:02.790 STDOUT [terraform] terraform:       + private_ip           = (known after apply)

20:47:02.790 STDOUT [terraform] terraform:       + ptr_record           = (known after apply)

20:47:02.790 STDOUT [terraform] terraform:       + public_dns           = (known after apply)

20:47:02.790 STDOUT [terraform] terraform:       + public_ip            = (known after apply)

20:47:02.790 STDOUT [terraform] terraform:       + public_ipv4_pool     = (known after apply)

20:47:02.790 STDOUT [terraform] terraform:       + region               = "us-west-2"

20:47:02.791 STDOUT [terraform] terraform:       + tags                 = {

20:47:02.791 STDOUT [terraform] terraform:           + "Name" = "public-http4-instance-http4-1"

20:47:02.791 STDOUT [terraform] terraform:         }

20:47:02.791 STDOUT [terraform] terraform:       + tags_all             = {

20:47:02.791 STDOUT [terraform] terraform:           + "Name" = "public-http4-instance-http4-1"

20:47:02.791 STDOUT [terraform] terraform:         }

20:47:02.791 STDOUT [terraform] terraform:     }

20:47:02.791 STDOUT [terraform] terraform:   # aws_instance.http1["instance-http1-1"] will be created

20:47:02.791 STDOUT [terraform] terraform:   + resource "aws_instance" "http1" {

20:47:02.791 STDOUT [terraform] terraform:       + ami                                  = "ami-05f991c49d264708f"

20:47:02.791 STDOUT [terraform] terraform:       + arn                                  = (known after apply)

20:47:02.791 STDOUT [terraform] terraform:       + associate_public_ip_address          = (known after apply)

20:47:02.791 STDOUT [terraform] terraform:       + availability_zone                    = (known after apply)

20:47:02.791 STDOUT [terraform] terraform:       + disable_api_stop                     = (known after apply)

20:47:02.791 STDOUT [terraform] terraform:       + disable_api_termination              = (known after apply)

20:47:02.791 STDOUT [terraform] terraform:       + ebs_optimized                        = (known after apply)

20:47:02.791 STDOUT [terraform] terraform:       + enable_primary_ipv6                  = (known after apply)

20:47:02.791 STDOUT [terraform] terraform:       + get_password_data                    = false

20:47:02.791 STDOUT [terraform] terraform:       + host_id                              = (known after apply)

20:47:02.791 STDOUT [terraform] terraform:       + host_resource_group_arn              = (known after apply)

20:47:02.791 STDOUT [terraform] terraform:       + iam_instance_profile                 = (known after apply)

20:47:02.791 STDOUT [terraform] terraform:       + id                                   = (known after apply)

20:47:02.791 STDOUT [terraform] terraform:       + instance_initiated_shutdown_behavior = (known after apply)

20:47:02.791 STDOUT [terraform] terraform:       + instance_lifecycle                   = (known after apply)

20:47:02.791 STDOUT [terraform] terraform:       + instance_state                       = (known after apply)

20:47:02.791 STDOUT [terraform] terraform:       + instance_type                        = "t3.micro"

20:47:02.791 STDOUT [terraform] terraform:       + ipv6_address_count                   = (known after apply)

20:47:02.791 STDOUT [terraform] terraform:       + ipv6_addresses                       = (known after apply)

20:47:02.791 STDOUT [terraform] terraform:       + key_name                             = "Infoimage"

20:47:02.791 STDOUT [terraform] terraform:       + monitoring                           = (known after apply)

20:47:02.791 STDOUT [terraform] terraform:       + outpost_arn                          = (known after apply)

20:47:02.791 STDOUT [terraform] terraform:       + password_data                        = (known after apply)

20:47:02.791 STDOUT [terraform] terraform:       + placement_group                      = (known after apply)

20:47:02.792 STDOUT [terraform] terraform:       + placement_partition_number           = (known after apply)

20:47:02.792 STDOUT [terraform] terraform:       + primary_network_interface_id         = (known after apply)

20:47:02.792 STDOUT [terraform] terraform:       + private_dns                          = (known after apply)

20:47:02.792 STDOUT [terraform] terraform:       + private_ip                           = "10.10.10.9"

20:47:02.792 STDOUT [terraform] terraform:       + public_dns                           = (known after apply)

20:47:02.792 STDOUT [terraform] terraform:       + public_ip                            = (known after apply)

20:47:02.792 STDOUT [terraform] terraform:       + region                               = "us-west-2"

20:47:02.792 STDOUT [terraform] terraform:       + secondary_private_ips                = (known after apply)

20:47:02.792 STDOUT [terraform] terraform:       + security_groups                      = (known after apply)

20:47:02.792 STDOUT [terraform] terraform:       + source_dest_check                    = true

20:47:02.792 STDOUT [terraform] terraform:       + spot_instance_request_id             = (known after apply)

20:47:02.792 STDOUT [terraform] terraform:       + subnet_id                            = (known after apply)

20:47:02.792 STDOUT [terraform] terraform:       + tags                                 = {

20:47:02.793 STDOUT [terraform] terraform:           + "Environment" = "development"

20:47:02.793 STDOUT [terraform] terraform:           + "Name"        = "instance-http1-1"

20:47:02.793 STDOUT [terraform] terraform:         }

20:47:02.793 STDOUT [terraform] terraform:       + tags_all                             = {

20:47:02.793 STDOUT [terraform] terraform:           + "Environment" = "development"

20:47:02.793 STDOUT [terraform] terraform:           + "Name"        = "instance-http1-1"

20:47:02.793 STDOUT [terraform] terraform:         }
20:47:02.793 STDOUT [terraform] terraform:       + tenancy                              = (known after apply)
20:47:02.793 STDOUT [terraform] terraform:       + user_data_base64                     = (known after apply)
20:47:02.793 STDOUT [terraform] terraform:       + user_data_replace_on_change          = false
20:47:02.793 STDOUT [terraform] terraform:       + vpc_security_group_ids               = (known after apply)
20:47:02.793 STDOUT [terraform] terraform:     }
20:47:02.793 STDOUT [terraform] terraform:   # aws_instance.http4["instance-http4-1"] will be created
20:47:02.793 STDOUT [terraform] terraform:   + resource "aws_instance" "http4" {
20:47:02.793 STDOUT [terraform] terraform:       + ami                                  = "ami-05f991c49d264708f"
20:47:02.793 STDOUT [terraform] terraform:       + arn                                  = (known after apply)
20:47:02.793 STDOUT [terraform] terraform:       + associate_public_ip_address          = (known after apply)
20:47:02.793 STDOUT [terraform] terraform:       + availability_zone                    = (known after apply)
20:47:02.793 STDOUT [terraform] terraform:       + disable_api_stop                     = (known after apply)
20:47:02.793 STDOUT [terraform] terraform:       + disable_api_termination              = (known after apply)
20:47:02.793 STDOUT [terraform] terraform:       + ebs_optimized                        = (known after apply)
20:47:02.793 STDOUT [terraform] terraform:       + enable_primary_ipv6                  = (known after apply)
20:47:02.793 STDOUT [terraform] terraform:       + get_password_data                    = false
20:47:02.793 STDOUT [terraform] terraform:       + host_id                              = (known after apply)
20:47:02.793 STDOUT [terraform] terraform:       + host_resource_group_arn              = (known after apply)
20:47:02.793 STDOUT [terraform] terraform:       + iam_instance_profile                 = (known after apply)
20:47:02.793 STDOUT [terraform] terraform:       + id                                   = (known after apply)
20:47:02.793 STDOUT [terraform] terraform:       + instance_initiated_shutdown_behavior = (known after apply)
20:47:02.793 STDOUT [terraform] terraform:       + instance_lifecycle                   = (known after apply)
20:47:02.793 STDOUT [terraform] terraform:       + instance_state                       = (known after apply)
20:47:02.793 STDOUT [terraform] terraform:       + instance_type                        = "t3.micro"
20:47:02.793 STDOUT [terraform] terraform:       + ipv6_address_count                   = (known after apply)
20:47:02.793 STDOUT [terraform] terraform:       + ipv6_addresses                       = (known after apply)
20:47:02.793 STDOUT [terraform] terraform:       + key_name                             = "Infoimage"
20:47:02.794 STDOUT [terraform] terraform:       + monitoring                           = (known after apply)
20:47:02.794 STDOUT [terraform] terraform:       + outpost_arn                          = (known after apply)
20:47:02.794 STDOUT [terraform] terraform:       + password_data                        = (known after apply)
20:47:02.794 STDOUT [terraform] terraform:       + placement_group                      = (known after apply)
20:47:02.794 STDOUT [terraform] terraform:       + placement_partition_number           = (known after apply)
20:47:02.794 STDOUT [terraform] terraform:       + primary_network_interface_id         = (known after apply)
20:47:02.794 STDOUT [terraform] terraform:       + private_dns                          = (known after apply)
20:47:02.794 STDOUT [terraform] terraform:       + private_ip                           = "10.10.10.10"
20:47:02.794 STDOUT [terraform] terraform:       + public_dns                           = (known after apply)
20:47:02.794 STDOUT [terraform] terraform:       + public_ip                            = (known after apply)
20:47:02.794 STDOUT [terraform] terraform:       + region                               = "us-west-2"
20:47:02.794 STDOUT [terraform] terraform:       + secondary_private_ips                = (known after apply)
20:47:02.794 STDOUT [terraform] terraform:       + security_groups                      = (known after apply)
20:47:02.794 STDOUT [terraform] terraform:       + source_dest_check                    = true
20:47:02.794 STDOUT [terraform] terraform:       + spot_instance_request_id             = (known after apply)
20:47:02.794 STDOUT [terraform] terraform:       + subnet_id                            = (known after apply)
20:47:02.794 STDOUT [terraform] terraform:       + tags                                 = {
20:47:02.794 STDOUT [terraform] terraform:           + "Environment" = "development"
20:47:02.794 STDOUT [terraform] terraform:           + "Name"        = "instance-http4-1"
20:47:02.794 STDOUT [terraform] terraform:         }
20:47:02.794 STDOUT [terraform] terraform:       + tags_all                             = {
20:47:02.794 STDOUT [terraform] terraform:           + "Environment" = "development"
20:47:02.794 STDOUT [terraform] terraform:           + "Name"        = "instance-http4-1"
20:47:02.794 STDOUT [terraform] terraform:         }
20:47:02.794 STDOUT [terraform] terraform:       + tenancy                              = (known after apply)
20:47:02.794 STDOUT [terraform] terraform:       + user_data_base64                     = (known after apply)
20:47:02.794 STDOUT [terraform] terraform:       + user_data_replace_on_change          = false
20:47:02.794 STDOUT [terraform] terraform:       + vpc_security_group_ids               = (known after apply)
20:47:02.794 STDOUT [terraform] terraform:     }
20:47:02.794 STDOUT [terraform] terraform:   # aws_internet_gateway.gw will be created
20:47:02.795 STDOUT [terraform] terraform:   + resource "aws_internet_gateway" "gw" {
20:47:02.795 STDOUT [terraform] terraform:       + arn      = (known after apply)
20:47:02.795 STDOUT [terraform] terraform:       + id       = (known after apply)
20:47:02.795 STDOUT [terraform] terraform:       + owner_id = (known after apply)
20:47:02.795 STDOUT [terraform] terraform:       + region   = "us-west-2"
20:47:02.795 STDOUT [terraform] terraform:       + tags     = {
20:47:02.795 STDOUT [terraform] terraform:           + "Name" = "internet-gateway"
20:47:02.795 STDOUT [terraform] terraform:         }
20:47:02.795 STDOUT [terraform] terraform:       + tags_all = {
20:47:02.795 STDOUT [terraform] terraform:           + "Name" = "internet-gateway"
20:47:02.795 STDOUT [terraform] terraform:         }
20:47:02.795 STDOUT [terraform] terraform:       + vpc_id   = (known after apply)
20:47:02.795 STDOUT [terraform] terraform:     }
20:47:02.795 STDOUT [terraform] terraform:   # aws_route_table.public will be created
20:47:02.795 STDOUT [terraform] terraform:   + resource "aws_route_table" "public" {
20:47:02.795 STDOUT [terraform] terraform:       + arn              = (known after apply)
20:47:02.795 STDOUT [terraform] terraform:       + id               = (known after apply)
20:47:02.795 STDOUT [terraform] terraform:       + owner_id         = (known after apply)
20:47:02.795 STDOUT [terraform] terraform:       + propagating_vgws = (known after apply)
20:47:02.795 STDOUT [terraform] terraform:       + region           = "us-west-2"
20:47:02.795 STDOUT [terraform] terraform:       + route            = [
20:47:02.795 STDOUT [terraform] terraform:           + {
20:47:02.795 STDOUT [terraform] terraform:               + carrier_gateway_id         = ""
20:47:02.795 STDOUT [terraform] terraform:               + cidr_block                 = "0.0.0.0/0"
20:47:02.795 STDOUT [terraform] terraform:               + core_network_arn           = ""
20:47:02.795 STDOUT [terraform] terraform:               + destination_prefix_list_id = ""
20:47:02.795 STDOUT [terraform] terraform:               + egress_only_gateway_id     = ""
20:47:02.795 STDOUT [terraform] terraform:               + gateway_id                 = (known after apply)
20:47:02.795 STDOUT [terraform] terraform:               + ipv6_cidr_block            = ""
20:47:02.795 STDOUT [terraform] terraform:               + local_gateway_id           = ""
20:47:02.795 STDOUT [terraform] terraform:               + nat_gateway_id             = ""
20:47:02.795 STDOUT [terraform] terraform:               + network_interface_id       = ""
20:47:02.795 STDOUT [terraform] terraform:               + transit_gateway_id         = ""
20:47:02.795 STDOUT [terraform] terraform:               + vpc_endpoint_id            = ""
20:47:02.795 STDOUT [terraform] terraform:               + vpc_peering_connection_id  = ""
20:47:02.795 STDOUT [terraform] terraform:             },
20:47:02.795 STDOUT [terraform] terraform:         ]
20:47:02.795 STDOUT [terraform] terraform:       + tags_all         = (known after apply)
20:47:02.795 STDOUT [terraform] terraform:       + vpc_id           = (known after apply)
20:47:02.795 STDOUT [terraform] terraform:     }
20:47:02.795 STDOUT [terraform] terraform:   # aws_route_table_association.http1 will be created
20:47:02.796 STDOUT [terraform] terraform:   + resource "aws_route_table_association" "http1" {
20:47:02.796 STDOUT [terraform] terraform:       + id             = (known after apply)
20:47:02.796 STDOUT [terraform] terraform:       + region         = "us-west-2"
20:47:02.796 STDOUT [terraform] terraform:       + route_table_id = (known after apply)
20:47:02.796 STDOUT [terraform] terraform:       + subnet_id      = (known after apply)
20:47:02.796 STDOUT [terraform] terraform:     }
20:47:02.796 STDOUT [terraform] terraform:   # aws_security_group.administration will be created
20:47:02.796 STDOUT [terraform] terraform:   + resource "aws_security_group" "administration" {
20:47:02.796 STDOUT [terraform] terraform:       + arn                    = (known after apply)
20:47:02.796 STDOUT [terraform] terraform:       + description            = "Allow default administration service"
20:47:02.796 STDOUT [terraform] terraform:       + egress                 = [
20:47:02.796 STDOUT [terraform] terraform:           + {
20:47:02.796 STDOUT [terraform] terraform:               + cidr_blocks      = [
20:47:02.796 STDOUT [terraform] terraform:                   + "0.0.0.0/0",
20:47:02.796 STDOUT [terraform] terraform:                 ]
20:47:02.796 STDOUT [terraform] terraform:               + description      = ""
20:47:02.796 STDOUT [terraform] terraform:               + from_port        = 0
20:47:02.796 STDOUT [terraform] terraform:               + ipv6_cidr_blocks = []
20:47:02.796 STDOUT [terraform] terraform:               + prefix_list_ids  = []
20:47:02.796 STDOUT [terraform] terraform:               + protocol         = "-1"
20:47:02.796 STDOUT [terraform] terraform:               + security_groups  = []
20:47:02.796 STDOUT [terraform] terraform:               + self             = false
20:47:02.796 STDOUT [terraform] terraform:               + to_port          = 0
20:47:02.796 STDOUT [terraform] terraform:             },
20:47:02.796 STDOUT [terraform] terraform:         ]
20:47:02.796 STDOUT [terraform] terraform:       + id                     = (known after apply)
20:47:02.796 STDOUT [terraform] terraform:       + ingress                = [
20:47:02.796 STDOUT [terraform] terraform:           + {
20:47:02.796 STDOUT [terraform] terraform:               + cidr_blocks      = [
20:47:02.796 STDOUT [terraform] terraform:                   + "0.0.0.0/0",
20:47:02.796 STDOUT [terraform] terraform:                 ]
20:47:02.796 STDOUT [terraform] terraform:               + description      = ""
20:47:02.796 STDOUT [terraform] terraform:               + from_port        = 22
20:47:02.796 STDOUT [terraform] terraform:               + ipv6_cidr_blocks = []
20:47:02.796 STDOUT [terraform] terraform:               + prefix_list_ids  = []
20:47:02.796 STDOUT [terraform] terraform:               + protocol         = "tcp"
20:47:02.796 STDOUT [terraform] terraform:               + security_groups  = []
20:47:02.796 STDOUT [terraform] terraform:               + self             = false
20:47:02.796 STDOUT [terraform] terraform:               + to_port          = 22
20:47:02.797 STDOUT [terraform] terraform:             },
20:47:02.797 STDOUT [terraform] terraform:           + {
20:47:02.797 STDOUT [terraform] terraform:               + cidr_blocks      = [
20:47:02.797 STDOUT [terraform] terraform:                   + "0.0.0.0/0",
20:47:02.797 STDOUT [terraform] terraform:                 ]
20:47:02.797 STDOUT [terraform] terraform:               + description      = ""
20:47:02.797 STDOUT [terraform] terraform:               + from_port        = 8
20:47:02.797 STDOUT [terraform] terraform:               + ipv6_cidr_blocks = []
20:47:02.797 STDOUT [terraform] terraform:               + prefix_list_ids  = []
20:47:02.797 STDOUT [terraform] terraform:               + protocol         = "icmp"
20:47:02.797 STDOUT [terraform] terraform:               + security_groups  = []
20:47:02.797 STDOUT [terraform] terraform:               + self             = false
20:47:02.797 STDOUT [terraform] terraform:               + to_port          = 0
20:47:02.797 STDOUT [terraform] terraform:             },
20:47:02.797 STDOUT [terraform] terraform:         ]
20:47:02.797 STDOUT [terraform] terraform:       + name                   = "administration"
20:47:02.797 STDOUT [terraform] terraform:       + name_prefix            = (known after apply)
20:47:02.797 STDOUT [terraform] terraform:       + owner_id               = (known after apply)
20:47:02.797 STDOUT [terraform] terraform:       + region                 = "us-west-2"
20:47:02.797 STDOUT [terraform] terraform:       + revoke_rules_on_delete = false
20:47:02.797 STDOUT [terraform] terraform:       + tags                   = {
20:47:02.797 STDOUT [terraform] terraform:           + "Name" = "administration"
20:47:02.797 STDOUT [terraform] terraform:         }
20:47:02.797 STDOUT [terraform] terraform:       + tags_all               = {
20:47:02.797 STDOUT [terraform] terraform:           + "Name" = "administration"
20:47:02.797 STDOUT [terraform] terraform:         }
20:47:02.797 STDOUT [terraform] terraform:       + vpc_id                 = (known after apply)
20:47:02.798 STDOUT [terraform] terraform:     }
20:47:02.798 STDOUT [terraform] terraform:   # aws_security_group.web will be created
20:47:02.798 STDOUT [terraform] terraform:   + resource "aws_security_group" "web" {
20:47:02.798 STDOUT [terraform] terraform:       + arn                    = (known after apply)
20:47:02.798 STDOUT [terraform] terraform:       + description            = "Allow web incgress trafic"
20:47:02.798 STDOUT [terraform] terraform:       + egress                 = [
20:47:02.798 STDOUT [terraform] terraform:           + {
20:47:02.798 STDOUT [terraform] terraform:               + cidr_blocks      = [
20:47:02.798 STDOUT [terraform] terraform:                   + "0.0.0.0/0",
20:47:02.798 STDOUT [terraform] terraform:                 ]
20:47:02.798 STDOUT [terraform] terraform:               + description      = ""
20:47:02.798 STDOUT [terraform] terraform:               + from_port        = 0
20:47:02.798 STDOUT [terraform] terraform:               + ipv6_cidr_blocks = []
20:47:02.798 STDOUT [terraform] terraform:               + prefix_list_ids  = []
20:47:02.798 STDOUT [terraform] terraform:               + protocol         = "-1"
20:47:02.798 STDOUT [terraform] terraform:               + security_groups  = []
20:47:02.798 STDOUT [terraform] terraform:               + self             = false
20:47:02.798 STDOUT [terraform] terraform:               + to_port          = 0
20:47:02.798 STDOUT [terraform] terraform:             },
20:47:02.798 STDOUT [terraform] terraform:         ]
20:47:02.798 STDOUT [terraform] terraform:       + id                     = (known after apply)
20:47:02.798 STDOUT [terraform] terraform:       + ingress                = [
20:47:02.798 STDOUT [terraform] terraform:           + {
20:47:02.798 STDOUT [terraform] terraform:               + cidr_blocks      = [
20:47:02.798 STDOUT [terraform] terraform:                   + "0.0.0.0/0",
20:47:02.798 STDOUT [terraform] terraform:                 ]
20:47:02.798 STDOUT [terraform] terraform:               + description      = ""
20:47:02.798 STDOUT [terraform] terraform:               + from_port        = 443
20:47:02.798 STDOUT [terraform] terraform:               + ipv6_cidr_blocks = []
20:47:02.798 STDOUT [terraform] terraform:               + prefix_list_ids  = []
20:47:02.798 STDOUT [terraform] terraform:               + protocol         = "tcp"
20:47:02.798 STDOUT [terraform] terraform:               + security_groups  = []
20:47:02.799 STDOUT [terraform] terraform:               + self             = false
20:47:02.799 STDOUT [terraform] terraform:               + to_port          = 443
20:47:02.799 STDOUT [terraform] terraform:             },
20:47:02.799 STDOUT [terraform] terraform:           + {
20:47:02.799 STDOUT [terraform] terraform:               + cidr_blocks      = [
20:47:02.799 STDOUT [terraform] terraform:                   + "0.0.0.0/0",
20:47:02.799 STDOUT [terraform] terraform:                 ]
20:47:02.799 STDOUT [terraform] terraform:               + description      = ""
20:47:02.799 STDOUT [terraform] terraform:               + from_port        = 80
20:47:02.799 STDOUT [terraform] terraform:               + ipv6_cidr_blocks = []
20:47:02.799 STDOUT [terraform] terraform:               + prefix_list_ids  = []
20:47:02.799 STDOUT [terraform] terraform:               + protocol         = "tcp"
20:47:02.799 STDOUT [terraform] terraform:               + security_groups  = []
20:47:02.799 STDOUT [terraform] terraform:               + self             = false
20:47:02.799 STDOUT [terraform] terraform:               + to_port          = 80
20:47:02.799 STDOUT [terraform] terraform:             },
20:47:02.799 STDOUT [terraform] terraform:         ]
20:47:02.799 STDOUT [terraform] terraform:       + name                   = "web"
20:47:02.799 STDOUT [terraform] terraform:       + name_prefix            = (known after apply)
20:47:02.799 STDOUT [terraform] terraform:       + owner_id               = (known after apply)
20:47:02.799 STDOUT [terraform] terraform:       + region                 = "us-west-2"
20:47:02.799 STDOUT [terraform] terraform:       + revoke_rules_on_delete = false
20:47:02.799 STDOUT [terraform] terraform:       + tags                   = {
20:47:02.799 STDOUT [terraform] terraform:           + "Name" = "web"
20:47:02.799 STDOUT [terraform] terraform:         }
20:47:02.799 STDOUT [terraform] terraform:       + tags_all               = {
20:47:02.799 STDOUT [terraform] terraform:           + "Name" = "web"
20:47:02.799 STDOUT [terraform] terraform:         }
20:47:02.799 STDOUT [terraform] terraform:       + vpc_id                 = (known after apply)
20:47:02.799 STDOUT [terraform] terraform:     }
20:47:02.799 STDOUT [terraform] terraform:   # aws_subnet.http1 will be created
20:47:02.799 STDOUT [terraform] terraform:   + resource "aws_subnet" "http1" {
20:47:02.799 STDOUT [terraform] terraform:       + arn                                            = (known after apply)
20:47:02.799 STDOUT [terraform] terraform:       + assign_ipv6_address_on_creation                = false
20:47:02.799 STDOUT [terraform] terraform:       + availability_zone                              = (known after apply)
20:47:02.799 STDOUT [terraform] terraform:       + availability_zone_id                           = (known after apply)
20:47:02.799 STDOUT [terraform] terraform:       + cidr_block                                     = "10.10.10.0/24"
20:47:02.799 STDOUT [terraform] terraform:       + enable_dns64                                   = false
20:47:02.799 STDOUT [terraform] terraform:       + enable_resource_name_dns_a_record_on_launch    = false
20:47:02.799 STDOUT [terraform] terraform:       + enable_resource_name_dns_aaaa_record_on_launch = false
20:47:02.800 STDOUT [terraform] terraform:       + id                                             = (known after apply)
20:47:02.800 STDOUT [terraform] terraform:       + ipv6_cidr_block_association_id                 = (known after apply)
20:47:02.800 STDOUT [terraform] terraform:       + ipv6_native                                    = false
20:47:02.800 STDOUT [terraform] terraform:       + map_public_ip_on_launch                        = false
20:47:02.800 STDOUT [terraform] terraform:       + owner_id                                       = (known after apply)
20:47:02.800 STDOUT [terraform] terraform:       + private_dns_hostname_type_on_launch            = (known after apply)
20:47:02.800 STDOUT [terraform] terraform:       + region                                         = "us-west-2"
20:47:02.800 STDOUT [terraform] terraform:       + tags                                           = {
20:47:02.800 STDOUT [terraform] terraform:           + "Name" = "subnet-http1"
20:47:02.800 STDOUT [terraform] terraform:         }
20:47:02.800 STDOUT [terraform] terraform:       + tags_all                                       = {
20:47:02.800 STDOUT [terraform] terraform:           + "Name" = "subnet-http1"
20:47:02.800 STDOUT [terraform] terraform:         }
20:47:02.800 STDOUT [terraform] terraform:       + vpc_id                                         = (known after apply)
20:47:02.800 STDOUT [terraform] terraform:     }
20:47:02.800 STDOUT [terraform] terraform:   # aws_vpc.terraform will be created
20:47:02.800 STDOUT [terraform] terraform:   + resource "aws_vpc" "terraform" {
20:47:02.800 STDOUT [terraform] terraform:       + arn                                  = (known after apply)
20:47:02.800 STDOUT [terraform] terraform:       + cidr_block                           = "10.10.0.0/16"
20:47:02.800 STDOUT [terraform] terraform:       + default_network_acl_id               = (known after apply)
20:47:02.800 STDOUT [terraform] terraform:       + default_route_table_id               = (known after apply)
20:47:02.800 STDOUT [terraform] terraform:       + default_security_group_id            = (known after apply)
20:47:02.800 STDOUT [terraform] terraform:       + dhcp_options_id                      = (known after apply)
20:47:02.800 STDOUT [terraform] terraform:       + enable_dns_hostnames                 = true
20:47:02.800 STDOUT [terraform] terraform:       + enable_dns_support                   = true
20:47:02.800 STDOUT [terraform] terraform:       + enable_network_address_usage_metrics = (known after apply)
20:47:02.800 STDOUT [terraform] terraform:       + id                                   = (known after apply)
20:47:02.800 STDOUT [terraform] terraform:       + instance_tenancy                     = "default"
20:47:02.800 STDOUT [terraform] terraform:       + ipv6_association_id                  = (known after apply)
20:47:02.800 STDOUT [terraform] terraform:       + ipv6_cidr_block                      = (known after apply)
20:47:02.801 STDOUT [terraform] terraform:       + ipv6_cidr_block_network_border_group = (known after apply)
20:47:02.801 STDOUT [terraform] terraform:       + main_route_table_id                  = (known after apply)
20:47:02.801 STDOUT [terraform] terraform:       + owner_id                             = (known after apply)
20:47:02.801 STDOUT [terraform] terraform:       + region                               = "us-west-2"
20:47:02.801 STDOUT [terraform] terraform:       + tags                                 = {
20:47:02.801 STDOUT [terraform] terraform:           + "Name" = "vpc-terraform"
20:47:02.801 STDOUT [terraform] terraform:         }
20:47:02.801 STDOUT [terraform] terraform:       + tags_all                             = {
20:47:02.801 STDOUT [terraform] terraform:           + "Name" = "vpc-terraform"
20:47:02.801 STDOUT [terraform] terraform:         }
20:47:02.801 STDOUT [terraform] terraform:     }
20:47:02.801 STDOUT [terraform] terraform: Plan: 11 to add, 0 to change, 0 to destroy.
20:47:02.801 STDOUT [terraform] terraform: 
20:47:02.801 STDOUT [terraform] terraform: Changes to Outputs:
20:47:02.801 STDOUT [terraform] terraform:   + http_ip1 = (known after apply)
20:47:02.801 STDOUT [terraform] terraform:   + http_ip4 = (known after apply)
20:47:04.240 STDOUT [terraform] terraform: aws_vpc.terraform: Creating...
20:47:14.244 STDOUT [terraform] terraform: aws_vpc.terraform: Still creating... [10s elapsed]
20:47:16.349 STDOUT [terraform] terraform: aws_vpc.terraform: Creation complete after 12s [id=vpc-0d4495943e3f4489e]
20:47:16.381 STDOUT [terraform] terraform: aws_internet_gateway.gw: Creating...
20:47:16.386 STDOUT [terraform] terraform: aws_security_group.administration: Creating...
20:47:16.386 STDOUT [terraform] terraform: aws_security_group.web: Creating...
20:47:16.920 STDOUT [terraform] terraform: aws_internet_gateway.gw: Creation complete after 1s [id=igw-0320e002cde02e3fa]
20:47:16.953 STDOUT [terraform] terraform: aws_subnet.http1: Creating...
20:47:16.953 STDOUT [terraform] terraform: aws_route_table.public: Creating...
20:47:17.590 STDOUT [terraform] terraform: aws_subnet.http1: Creation complete after 1s [id=subnet-07c305f7a4236040b]
20:47:18.091 STDOUT [terraform] terraform: aws_route_table.public: Creation complete after 1s [id=rtb-0b3b8c5ffeda3842a]
20:47:18.115 STDOUT [terraform] terraform: aws_route_table_association.http1: Creating...
20:47:18.671 STDOUT [terraform] terraform: aws_route_table_association.http1: Creation complete after 1s [id=rtbassoc-08ffaf5e600568a99]
20:47:19.071 STDOUT [terraform] terraform: aws_security_group.administration: Creation complete after 3s [id=sg-0f27ea957445470ce]
20:47:19.093 STDOUT [terraform] terraform: aws_security_group.web: Creation complete after 3s [id=sg-084a2a428939ff3cc]
20:47:19.128 STDOUT [terraform] terraform: aws_instance.http1["instance-http1-1"]: Creating...
20:47:19.129 STDOUT [terraform] terraform: aws_instance.http4["instance-http4-1"]: Creating...
20:47:29.129 STDOUT [terraform] terraform: aws_instance.http4["instance-http4-1"]: Still creating... [10s elapsed]
20:47:29.129 STDOUT [terraform] terraform: aws_instance.http1["instance-http1-1"]: Still creating... [10s elapsed]
20:47:32.025 STDOUT [terraform] terraform: aws_instance.http4["instance-http4-1"]: Creation complete after 13s [id=i-02fa0c4bb5b45e54f]
20:47:32.054 STDOUT [terraform] terraform: aws_eip.public_http4["instance-http4-1"]: Creating...
20:47:32.054 STDOUT [terraform] terraform: aws_instance.http1["instance-http1-1"]: Creation complete after 13s [id=i-0607b209080226dff]
20:47:32.078 STDOUT [terraform] terraform: aws_eip.public_http1["instance-http1-1"]: Creating...
20:47:34.271 STDOUT [terraform] terraform: aws_eip.public_http1["instance-http1-1"]: Creation complete after 2s [id=eipalloc-0e5f7d2bad733efff]
20:47:34.374 STDOUT [terraform] terraform: aws_eip.public_http4["instance-http4-1"]: Creation complete after 2s [id=eipalloc-0a4e5a35462fb6d83]
20:47:34.440 STDOUT [terraform] terraform: 
20:47:34.440 STDOUT [terraform] terraform: Apply complete! Resources: 11 added, 0 changed, 0 destroyed.

20:47:34.441 STDOUT [terraform] terraform: 
20:47:34.441 STDOUT [terraform] terraform: Outputs:

20:47:34.441 STDOUT [terraform] terraform: 
20:47:34.441 STDOUT [terraform] terraform: http_ip1 = {

20:47:34.441 STDOUT [terraform] terraform:   "i-0607b209080226dff" = "10.10.10.9"

20:47:34.441 STDOUT [terraform] terraform: }

20:47:34.442 STDOUT [terraform] terraform: http_ip4 = {

20:47:34.442 STDOUT [terraform] terraform:   "i-02fa0c4bb5b45e54a" = "10.10.10.10"

20:47:34.442 STDOUT [terraform] terraform: }


