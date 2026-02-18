module "resource_group" {
  source = "../../../."

  environment = "box"
  location    = "eastus"
  namespace   = "test-ssh-key"

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
  namespace           = "test-ssh-key"
  resource_group_name = module.resource_group.name

  tags = {
    appid              = "app-6138"
    architecture       = "native"
    owner              = "cloudoperations@websterbank.com"
    purpose            = "Used to test the Terraform SSH Public Key Module."
    terraform_resource = "true"
  }
}
