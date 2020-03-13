provider "aws" {
  region  = var.region
  profile = var.profile
  #access_key = var.access_key
  #secret_key = var.secret_key
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
    Name        = "Slave"
  }
}

/*
module "ec2_cluster-master" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  ami            = var.ami
  instance_type  = "t2.medium"
  instance_count = "1"
  name           = "Master"
  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "Master"
  }
  key_name               = var.key_name
  monitoring             = true
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
}
*/
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
    conn_str = "postgresql://terraform:terraformaws@192.168.100.66:5432/terraformdb"
  }
}
*/