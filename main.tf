resource "tls_private_key" "this" {
  count = var.public_key == null ? 1 : 0

  algorithm = "RSA"
  rsa_bits  = var.rsa_bits
}

resource "azurerm_ssh_public_key" "this" {
  location            = var.location
  name                = local.ssh_public_key_tags["Name"]
  public_key          = var.public_key != null ? var.public_key : tls_private_key.this[0].public_key_openssh
  resource_group_name = var.resource_group_name

  tags = local.ssh_public_key_tags
}