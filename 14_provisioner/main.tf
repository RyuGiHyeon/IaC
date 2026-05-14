variable "sensitive_content" {
    type = string
    default = "P@ssw0rd123"
    sensitive = false  
}

resource "local_file" "file1" {
  content = var.sensitive_content
  filename = "${path.module}/file1.txt"

  provisioner "file" {
    source = self.filename
    destination = "file1.txt"
    connection {
      user = "ec2-user"
      password = "1234"
      host = "192.168.31.111"
    }
  }
}
