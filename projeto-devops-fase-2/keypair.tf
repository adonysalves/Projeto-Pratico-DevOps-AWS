resource "aws_key_pair" "minha_key" {
  key_name   = "minha-key-terraform"
  public_key = file("${path.module}/minha-chave.pub")
}