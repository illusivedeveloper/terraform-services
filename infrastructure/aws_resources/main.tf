provider "aws" {
  region  = var.region
  #profile = var.profile
  access_key = var.access_key
  secret_key = var.secret_key
}
module "ec2_cluster-slave" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name           = "Slave"
  instance_count = var.instance_count

  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  monitoring             = false
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "Slave"
  }
}


module "ec2_cluster-master" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  ami            = var.ami
  instance_type  = "t2.large"
  instance_count = "1"
  name           = "Master"
  tags = {
    Terraform   = "true"
    Environment = "dev"
    Name        = "Master"
  }
  key_name               = var.key_name
  monitoring             = false
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id              = var.subnet_id
}

/*
#Mongo backend
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
#PostgreSQL backend
terraform {
  backend "pg" {
    conn_str = "postgres://terraform:terraformaws@172.17.0.2:5432/terraformdb"
  }
}
*/

#PostgreSQL backend
provider "postgresql" {
  host            = "172.17.0.2"
  port            = 5432
  database        = "terraformdb"
  username        = "terraform"
  password        = "terraformaws"
  sslmode         = "disable"
  connect_timeout = 15
}