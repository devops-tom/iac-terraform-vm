
output "private_key" {
  value = data.aws_key_pair.generated_key.private_key_pem
}
