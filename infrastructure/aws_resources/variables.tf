variable "region"{
    default = "us-east-1"
}

variable "profile" {
    default = "default"
}
variable "name" {
    default = "TerraformExample"
}
variable "instance_count" {
    default = "5"

}
variable "ami" {
    default = "ami-04b9e92b5572fa0d1"
}
variable "instance_type" {
    default = "t2.micro"
}
variable "key_name" {
    default = "useast"
}

variable "vpc_security_group_ids" {
   default = ["sg-05db7c41"]
}
variable "subnet_id" {
    default = "subnet-50660e7e"

}
