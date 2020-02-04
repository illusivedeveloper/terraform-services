variable "instance_count" {
  default = "3"
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = "ami-062f7200baf2fa504"
}

variable "key_name" {
  description = "The key name to use for the instance"
  type        = string
  default     = "east-1_ec2"
}

variable "public_key" {
  description = "The key name to use for the instance"
  type        = string
  default     = ""
  #default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCFipNEo9tI4DqBF0veviy2CWDYs1dYEKjGJHN1zgbRgcAA83Bxhhy27NbZ1XqRVl18Vjn0iwzwXi3TNGeauUJPWAgO4HZ76raieWRAYYgCWigsucXIqntCw8IpqSLEhcnbcztKC7h3GV120nJaJwOe8w6F3AYf8McdapAUROETEJkVdrOWeOJBFCD+1jz9Xv1kLNKD203FLA8k4ibn3fvKvWm3R/Mh4FaLsZWNQDs885GFPshwYy45sFRiVcX1TDKq3N44k7YQ0TH1qT6M1X3QRW7vk1JC5ZkUZHTuuyHSGIa/hnxXtPRH66Pudnnz+wBqRNdtYWhJa/hjjmYfipPf"
}

variable "region" {
  description = "The aws region to use"
  type        = string
  default     = "us-east-1"
}
