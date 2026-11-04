# First resource
resource "local_file" "first" {
  filename = "first.txt"
  content  = "This is the first resource."
}

# Second resource
resource "local_file" "second" {
  filename = "second.txt"
  content  = "This is the second resource."

  depends_on = [
    local_file.first
  ]
}

# Read an existing file
data "local_file" "existing" {
  filename = "${path.module}/devops.txt"
}

# Display existing file content
output "existing_file_content" {
  value = data.local_file.existing.content
}
