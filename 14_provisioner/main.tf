variable "index" {
  type      = string
  default   = "<?php phpinfo(); ?>"
  sensitive = false
}

resource "local_file" "file1" {
  content  = var.index
  filename = "${path.module}/index.php"

  connection {
    user        = "ec2-user"
    private_key = file("./id_ed25519")
    host        = "192.168.31.111"
  }

  provisioner "file" {
    source      = self.filename
    destination = "/tmp/index.php"

  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install httpd php -y",
      "sudo systemctl start httpd.service",
      "sudo firewall-cmd --add-port=80/tcp",
      "sudo cp /tmp/index.php /var/www/html"
    ]
  }
}
