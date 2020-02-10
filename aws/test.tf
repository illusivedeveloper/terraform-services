provider "aws" {
  region                 = "us-east-1"
  profile                = "default"
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
    conn_str = "postgresql://terraform:terraformaws@192.168.100.72:5432/terraformdb"
  }
}
*/
module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "my-cluster"
  instance_count         = 8

  ami                    = "ami-04b9e92b5572fa0d1"
  instance_type          = "t2.micro"
  key_name               = "useast"
  monitoring             = true
  vpc_security_group_ids = ["sg-05db7c41"]
  subnet_id              = "subnet-50660e7e"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}


/*
data "terraform_remote_state" "foo" {
  backend = "http"
  config = {
    address = "http://192.168.104.110:5000/terraformaws"
  }
}*/
