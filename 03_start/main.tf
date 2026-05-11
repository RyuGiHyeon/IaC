terraform {
  required_providers {
    local = {
      version = "~> 2.0.0"
    }
  }
}

locals {
  key1 = "vlaue1"
  num1 = 123
  text = <<EOF
Multi
Line
String
with anytext
EOF
}

resource "local_file" "files" {
  count = 10
  content  = "${local.text}"
  filename = "${path.module}/file${count.index + 10}.txt"
}
