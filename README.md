# Azure SSH Public Key Module

## Description

Terraform module to create Azure SSH Public Keys for VM authentication. This is the Azure equivalent of the AWS EC2 Key Pair module.

## Notes

This module creates and manages Azure SSH Public Keys with:
- **TLS private key generation**: Creates RSA key pair (default 4096 bits)
- **Azure SSH Public Key resource**: Stores the public key in Azure for VM reference
- **Sensitive output handling**: Private key output is marked sensitive

**Important:** This module requires defining an output in the root module so you can access the module attribute `private_key_pem`.

- When defining the output in the root module you **must** set `sensitive = true`.
- Example output:

```hcl
output "ssh_private_key_pem" {
  value       = module.ssh_key.private_key_pem
  sensitive   = true
  description = "(string) - Private key for the SSH key."
}
```

- To view the output containing the **private key** via the **CLI**, point your Terraform backend to the workspace that has the output stored and run:

```bash
terraform output -raw ssh_private_key_pem
```

- To save the output into a pem file:

```bash
terraform output -raw ssh_private_key_pem > file_name.pem
```

## Release Notes

*Note: Complete any required actions for each set of release notes between the version the module is on and the version it is being upgraded to.*

- Release 0.0.1:
  - Initial release

## Usage examples

```Reference the code in examples/*```
