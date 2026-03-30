output "id" {
  value       = azurerm_ssh_public_key.this.id
  description = "(string) - The ID of the SSH Public Key."
}

output "private_key_pem" {
  value       = var.public_key != null ? null : tls_private_key.this[0].private_key_pem
  description = "(string) - The private key in PEM format. Null if existing public key was provided."
  sensitive   = true
}

output "public_key_openssh" {
  value       = azurerm_ssh_public_key.this.public_key
  description = "(string) - The public key in OpenSSH authorized_keys format."
}