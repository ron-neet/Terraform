resource "local_file" "file" {
  filename = var.file_name
  content  = var.file_content
}
