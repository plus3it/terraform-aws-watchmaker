output "private_key" {
  description = "Private key for the keypair"
  value       = join("", tls_private_key.this.*.private_key_pem)
  sensitive   = true
}

output "build_id" {
  value = local.build_id
}
