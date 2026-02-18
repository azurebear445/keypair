# Default Example

This example demonstrates basic usage of the SSH Public Key module.

## Usage

1. Configure your Azure credentials in `vcs_vars.auto.tfvars` or via environment variables
2. Run `terraform init`
3. Run `terraform plan`
4. Run `terraform apply`

## Outputs

- `ssh_public_key_id` - The ID of the created SSH Public Key resource
- `ssh_private_key_pem` - The private key in PEM format (sensitive)

To retrieve the private key:

```bash
terraform output -raw ssh_private_key_pem > my_key.pem
chmod 600 my_key.pem
```
