output "ssh_private_key_pem" {
  description = "(string) - The private key in PEM format."
  sensitive   = true
  value       = module.ssh_public_key.private_key_pem
}

output "ssh_public_key_id" {
  description = "(string) - The ID of the SSH Public Key."
  value       = module.ssh_public_key.id
}
