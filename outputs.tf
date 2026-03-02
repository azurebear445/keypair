output "id" {
  description = "(string) - The ID of the SSH Public Key."
  value       = azurerm_ssh_public_key.this.id
}

output "private_key_pem" {
  description = "(string) - The private key in PEM format. Must be marked sensitive in root module."
  sensitive   = true
  value       = tls_private_key.this.private_key_pem
}

output "public_key_openssh" {
  description = "(string) - The public key in OpenSSH authorized_keys format."
  value       = tls_private_key.this.public_key_openssh
}
