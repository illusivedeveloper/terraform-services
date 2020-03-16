variable "subscription_id" {
  default = ""
}

variable "client_id" {
  default = ""
}

variable "client_secret" {
  default = ""
}

variable "tenant_id" {
  default = ""
}

variable "location" {
  default = "westus2"
}

variable "vm_hostname" {
  default = "terraform"
}

variable "nb_instances" {
  default = "2"
}

variable "vm_os_publisher" {
  default = "Canonical"
}

variable "vm_os_offer" {
  default = "UbuntuServer"
}

variable "vm_os_sku" {
  default = "14.04.2-LTS"
}

variable "data_disk_size_gb" {
  default = "64"
}
