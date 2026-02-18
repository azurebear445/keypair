resource "random_id" "this" {
  byte_length = 3
  keepers = {
    environment         = var.environment
    location            = var.location
    namespace           = var.namespace
    resource_group_name = var.resource_group_name
  }
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = var.rsa_bits
}

resource "azurerm_ssh_public_key" "this" {
  location            = var.location
  name                = local.ssh_public_key_tags["Name"]
  public_key          = tls_private_key.this.public_key_openssh
  resource_group_name = var.resource_group_name

  tags = local.ssh_public_key_tags
}
