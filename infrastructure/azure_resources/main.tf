provider "azurerm" {
  version         = "=1.43.0"
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}
module "linuxservers" {
  source                        = "Azure/compute/azurerm"
  resource_group_name           = "terraform-advancedvms"
  location                      = var.location
  vm_hostname                   = var.vm_hostname
  nb_public_ip                  = "0"
  remote_port                   = "22"
  nb_instances                  = var.nb_instances
  vm_os_publisher               = var.vm_os_publisher
  vm_os_offer                   = var.vm_os_offer
  vm_os_sku                     = var.vm_os_sku
  vnet_subnet_id                = module.network.vnet_subnets[0]
  boot_diagnostics              = "true"
  delete_os_disk_on_termination = "true"
  data_disk                     = "true"
  data_disk_size_gb             = var.data_disk_size_gb
  data_sa_type                  = "Premium_LRS"

  tags = {
    environment = "dev"
  }

  enable_accelerated_networking = "false"
}

module "network" {
  source              = "Azure/network/azurerm"
  version             = "~> 1.1.1"
  location            = var.location
  allow_rdp_traffic   = "true"
  allow_ssh_traffic   = "true"
  resource_group_name = "terraform-vms"
}
