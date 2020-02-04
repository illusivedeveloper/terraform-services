provider "aws" {
  profile = "aws_ayush"
  #access_key=""
  #secret_key=""
  region = var.region
}

resource "aws_instance" "Texample" {
  count         = var.instance_count
  ami           = var.ami
  instance_type = var.instance_type

  tags = {
    Name = "Terraform-E-${count.index + 1}"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = var.public_key
}
