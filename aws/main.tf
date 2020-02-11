provider "aws" {
  region  = var.region
  profile = var.profile
}
module "ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name           = var.name
  instance_count = var.instance_count

  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = true
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

/*
terraform {
  backend "http" {
    address = "http://192.168.104.110:5000/terraformaws"
  }
    required_providers {
    aws = ">= 2.7.0"
  }
}
*/

/*
terraform {
  backend "pg" {
    conn_str = "postgresql://postgres:test123@192.168.104.110:5432/terraform"
  }
}
*/

/*
terraform {
  backend "pg" {
    conn_str = "postgresql://terraform:terraformaws@192.168.100.72:5432/terraformdb"
  }
}
*/
