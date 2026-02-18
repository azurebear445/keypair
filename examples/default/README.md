# Default Example

This example demonstrates basic usage of the SSH Public Key module with default RSA 4096-bit key generation.

```terraform
module "ssh_public_key" {
  source = "../../."

  environment         = "box"
  location            = "eastus"
  namespace           = "test-ssh-key"
  resource_group_name = "rg-test-ssh-key-box-eastus"

  tags = {
    appid              = "app-6138"
    architecture       = "native"
    owner              = "cloudoperations@websterbank.com"
    purpose            = "Used to test the Terraform SSH Public Key Module."
    terraform_resource = "true"
  }
}
```
