# SSH 개인키/공개키 쌍 생성
resource "tls_private_key" "ssh_public_key" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}

# 생성된 공개키를 AWS EC2 Key Pair로 등록
resource "aws_key_pair" "ssh_public_key" {
  public_key = tls_private_key.ssh_public_key.public_key_openssh
  key_name   = "terraform-${lower(var.algorithm)}-key"
}
