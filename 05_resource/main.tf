terraform {
  required_version = "~> 1.0"
  required_providers {
    local = {
        version = "~> 2.5"
    }
  }
}

resource "local_file" "file1" {
  content = var.ACCESS_KEY
  filename = "${path.module}/file1.txt"
}

resource "local_file" "file2" {
  content = "SECRET: ${var.SECRET_KEY}"
  filename = "${path.module}/file2.txt"
}