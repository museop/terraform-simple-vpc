resource "tls_private_key" "rsa_4096_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name = var.key_name
  public_key = tls_private_key.rsa_4096_key.public_key_openssh
}
