# Existing Key Example

This example demonstrates using the SSH Public Key module with an existing SSH public key instead of generating a new one.

```terraform
# Simulates an existing SSH key (in real usage, user would have their own key)
resource "tls_private_key" "existing" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

module "resource_group" {
  source = "../../../."

  environment = "box"
  location    = "eastus"
  namespace   = "test-existing-key"

  tags = {
    appid              = "app-6138"
    architecture       = "native"
    owner              = "cloudoperations@websterbank.com"
    purpose            = "Used to test the Terraform Resource Group Module."
    terraform_resource = "true"
  }
}

module "ssh_public_key" {
  source = "../../."

  environment         = "box"
  location            = "eastus"
  namespace           = "test-existing-key"
  public_key          = tls_private_key.existing.public_key_openssh
  resource_group_name = module.resource_group.name

  tags = {
    appid              = "app-6138"
    architecture       = "native"
    owner              = "cloudoperations@websterbank.com"
    purpose            = "Used to test the Terraform SSH Public Key Module."
    terraform_resource = "true"
  }
}
```
