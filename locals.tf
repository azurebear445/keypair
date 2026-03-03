locals {
  module_name              = "terraform-azurerm-ssh_public_key"
  module_version           = "0.0.1"
  location                 = var.location == "eastus" ? var.location : "ncus"
  is_region_eastus         = var.location == "eastus"
  is_region_northcentralus = var.location == "northcentralus"
}
