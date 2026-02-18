output "ssh_public_key_id" {
  value       = module.ssh_public_key.id
  description = "(string) - The ID of the SSH Public Key."
}

output "ssh_public_key_openssh" {
  value       = module.ssh_public_key.public_key_openssh
  description = "(string) - The public key in OpenSSH format."
}

output "ssh_private_key_pem" {
  value       = module.ssh_public_key.private_key_pem
  sensitive   = true
  description = "(string) - The private key in PEM format."
}
