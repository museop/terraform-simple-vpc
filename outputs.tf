output "private_key" {
  value = tls_private_key.rsa_4096_key.private_key_pem
  sensitive = true
}