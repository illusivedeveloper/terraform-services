provider "aws" {
  region                 = "us-east-1"
  profile                = "aws_ayush"
}


terraform {
  backend "http" {
    address = "http://192.168.104.110:5000/terraformaws"
  }
    required_providers {
    aws = ">= 2.7.0"
  }
}

module "ec2_cluster" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "my-cluster"
  instance_count         = 5

  #region                 = "us-east-1"
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
    address = "http://192.168.104.110:5000/terraformaws/"
    update_method = "POST"
  }
} */
