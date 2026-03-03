locals {
  is_region_eastus         = var.location == "eastus"
  is_region_northcentralus = var.location == "northcentralus"
  location                 = var.location == "eastus" ? var.location : "ncus"
  module_name              = "terraform-azurerm-ssh_public_key"
  module_version           = "0.0.1"
}