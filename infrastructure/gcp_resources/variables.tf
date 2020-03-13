variable "file_path" {
  default = ""
}


variable "project_id" {
  default = ""
}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-a"
}

variable "name" {
  default = "terraform-test"
}


variable "machine_type" {
  default = "f1-micro"
}

variable "image" {
  default = "debian-cloud/debian-9"
}

variable "network" {
  default = "default"
}

variable "user" {
  default = ""
}

variable "ssh_key" {
  default = "~/.ssh/id_rsa"
}
