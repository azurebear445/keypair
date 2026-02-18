output "id" {
  value       = azurerm_ssh_public_key.this.id
  description = "(string) - The ID of the SSH Public Key."
}

output "public_key_openssh" {
  value       = tls_private_key.this.public_key_openssh
  description = "(string) - The public key in OpenSSH authorized_keys format."
}

output "private_key_pem" {
  value       = tls_private_key.this.private_key_pem
  sensitive   = true
  description = "(string) - The private key in PEM format. Must be marked sensitive in root module."
}
