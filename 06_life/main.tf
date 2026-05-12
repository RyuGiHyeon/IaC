resource "local_file" "abc" {
  content = "lifecycle - step 5"
  filename = "${path.module}/abcde.txt"
  lifecycle {
    prevent_destroy = true
  }
}