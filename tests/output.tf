output "private_key" {
  description = "Private key for the keypair"
  value       = join("", tls_private_key.this.*.private_key_pem)
}

output "build_id" {
  value = local.build_id
}
